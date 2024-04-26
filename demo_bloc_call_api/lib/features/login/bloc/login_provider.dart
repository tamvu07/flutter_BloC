


import 'package:demo_bloc_call_api/features/login/bloc/login_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginProvider extends StatelessWidget {
  final Widget child;
  const LoginProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
      create: (BuildContext context) => LoginBloc(),
      child: child,
    );
  }
}