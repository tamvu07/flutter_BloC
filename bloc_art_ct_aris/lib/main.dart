import 'package:bloc_art_ct_aris/common/utils/context+extensions.dart';
import 'package:bloc_art_ct_aris/login/bloc/login_bloc.dart';
import 'package:bloc_art_ct_aris/login/services/login_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => LoginBloc(loginService: LoginService()),
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return Scaffold(
              body: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Expanded(flex: 4, child: Container()),
                    const Expanded(
                        flex: 4,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [LoginButton()],
                        ))
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class LoginButton extends StatefulWidget {
  const LoginButton({super.key});

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  Future<void> actionLogin(BuildContext context) async {
    var username = "user@yahoo.com";
    var password = "12345612";

    BlocProvider.of<LoginBloc>(context)
        .add(StartLoginEvent(username, password));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<LoginBloc>().stream.listen((loginState) {
      switch (loginState.status) {
        case LoginStatus.initial:
          break;
        case LoginStatus.loading:
          context.showLoadingDialog();
        case LoginStatus.success:
          context.dismissDialog();
          var token = loginState.data?.token;
          context.showErrorDialog("Thanh cong nha token la: \n $token");
          break;
        case LoginStatus.failure:
          context.dismissDialog();
          context.showErrorDialog(loginState.error!.getErrorMsg());
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        child: const Text('login'),
        onPressed: () {
          actionLogin(context);
        });
  }
}
