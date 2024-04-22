
import 'package:demo_bloc_call_api/features/post/posts/posts_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsProvider extends StatelessWidget {
  final Widget child;
  const PostsProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PostsBloc>(
      create: (BuildContext context) => PostsBloc(),
      child: child,
    );
  }
}