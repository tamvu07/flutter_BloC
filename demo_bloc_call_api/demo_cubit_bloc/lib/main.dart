import 'package:demo_cubit_bloc/cubit/theta_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

// video huong dan: https://www.youtube.com/watch?v=2MHyrcyfIbs&list=PL0feeJIlTI8mNqL0RoqLWuWF8jAVcwyL1&index=3

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "",
        home: BlocProvider(
          create: (context) => ThetaCubit(),
          child: BlocBuilder<ThetaCubit, ThetaState>(
            builder: (context, state) {
              Widget responseWidget = Container();
              if (state is ThetaInitial) {
                responseWidget = Text(state.responseText);
              } else if (state is ThetaLoading) {
                responseWidget = const CircularProgressIndicator();
              }  else if (state is ThetaLoaded) {
                responseWidget = Text(state.responseText);
              }
              return Scaffold(
                body: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Expanded(flex: 4, child: responseWidget),
                      Expanded(
                        flex: 4, 
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(child: const Text('info'), onPressed: () {
                            context.read<ThetaCubit>().getInfo();
                          }),
                          ElevatedButton(child: const Text('UrgencySetting'), onPressed: () {
                            context.read<ThetaCubit>().getUrgencySetting();
                          }),
                        ],
                      ))
                    ],
                  ),
                ),
              );
            },
          ),
        ));
  }
}
