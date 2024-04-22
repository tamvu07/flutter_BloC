import 'package:demo_bloc_call_api/features/posts/posts_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/posts/posts_event.dart';
import 'features/posts/posts_provider.dart';
import 'features/posts/posts_state.dart';

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
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const PostsPage(),
    );
  }
}

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {

  final PostsBloc postsBloc = PostsBloc();

  @override
  Widget build(BuildContext context) {
    // khac nha la dung BlocBuilder va dung BlocConsumer
    // BlocBuilder chua biet chac listening su kien tu viewmodel con BlocConsumer co roi nha
    return PostsProvider(
      child: MaterialApp(
        home: Scaffold(
          body: BlocBuilder<PostsBloc, PostsState> (builder: ((context, postsBloc){
            switch (postsBloc.runtimeType) {
              case LoadingGetDataState:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case SuccessGetDataState:
                final successState = postsBloc as SuccessGetDataState;
                return Center(
              child:  ListView.builder(
                itemCount: successState.posts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text(successState.posts[index].id.toString(), style: TextStyle(fontSize: 30, color: Colors.red),),
                    title: Text(successState.posts[index].title),
                    subtitle: Text(successState.posts[index].userId.toString()),
                  );
                },
              ),
            );
              case SuccessAddDataState:
                return const Center (
                  child: Text("Add Success ...."),
                );
              case ErrorAddDataState:
            child: return const Center (
              child: Text("Add Error ...."),
            );
            }
            return Column(
              children: [
                SizedBox(height: 50),
                Text("Request API", style: TextStyle(fontSize: 20),),
                _customButton(() => _getDataAPI(context), "Get Data API"),
                SizedBox(height: 50),
                _customButton(() => _addDataAPI(context), "Add Data API"),
              ],
            );
          })),
        )
      ),
    );


    // return Scaffold(
    //   body: BlocConsumer<PostsBloc, PostsState>(
    //     bloc: postsBloc,
    //     listenWhen: (previous, current) => current is PostsActionState,
    //     buildWhen: (previous, current) => current is! PostsActionState,
    //     listener: (context, state) {},
    //     builder: (context, state) {
    //       switch (state.runtimeType) {
    //         case PostsFetchingLoadingState
    //       }
    //     },
    //   )
    // );
  }

  Widget _customButton(Function() onPressed, String text) {
    return ElevatedButton(onPressed: onPressed, child: Text(text));
  }

  _getDataAPI(BuildContext context) {
    context.read<PostsBloc>().add(FetchDataEvent());
  }

  _addDataAPI(BuildContext context) {
    context.read<PostsBloc>().add(AddDataEvent());
  }
}
