import 'dart:async';

import 'package:demo_bloc_call_api/features/login/auth/model_converter.dart';
import 'package:demo_bloc_call_api/features/login/bloc/login_bloc.dart';
import 'package:demo_bloc_call_api/features/login/bloc/login_event.dart';
import 'package:demo_bloc_call_api/features/login/bloc/login_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:demo_bloc_call_api/features/login/auth/viewmodel/loginInPutModel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth/auth_service.dart';
import 'package:demo_bloc_call_api/features/login/auth/viewmodel/LoginOutPutModel.dart';

import 'bloc/login_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return LoginProvider(
        child: Scaffold(
          body: BlocConsumer<LoginBloc, LoginState>(
              listener: (context, state) {

              },
              builder: ((context, loginBloc){
                switch (loginBloc.runtimeType) {
                  case LoadingLoginState:
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  case SuccessLoginState:
                    return StreamBuilder<String>(
                      stream: context.read<LoginBloc>().tokenStream,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          var token = snapshot.data!;
                          return Center (
                            child: Text("Login Success with token: \n $token"),
                          );
                        } else {
                          return const Center (
                            child: Text("Login Success ...."),
                          );
                        }
                      },
                    );

                  case ErrorLoginState:
                    return const Center (
                      child: Text("Login Error ...."),
                    );
                }
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    _customButton(() => _actionBack(context), "Back"),
                    const SizedBox(height: 10),
                    _customButton(() => _actionLogin(context), "Login"),
                    const SizedBox(height: 10),
                    _textUserName(context),
                    const SizedBox(height: 10),
                    _textPassword(context)
                  ],
                );
              })),
        ),
    );
  }

  Widget _customButton(Function() onPressed, String text) {
    return ElevatedButton(onPressed: onPressed, child: Text(text));
  }

  _actionBack(BuildContext context) {
    Navigator.pop(context);
  }

  _actionLogin(BuildContext context) {
    String username = _usernameController.text;
    String password = _passwordController.text;
    context.read<LoginBloc>().add(StartLoginEvent(username, password));
  }

  Widget _textUserName(BuildContext context) {
    return TextField(
      controller: _usernameController,
      decoration: const InputDecoration(
        labelText: 'Username',
      ),
    );
  }

  Widget _textPassword(BuildContext context) {
    return TextField(
      controller: _passwordController,
      decoration: const InputDecoration(
        labelText: 'Password',
      ),
    );
  }
}
