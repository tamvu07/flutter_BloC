import 'package:demo_bloc_call_api/features/login/auth/model_converter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:demo_bloc_call_api/features/login/auth/viewmodel/loginInPutModel.dart';
import 'auth/auth_service.dart';
import 'package:demo_bloc_call_api/features/login/auth/viewmodel/LoginOutPutModel.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final AuthService authService = AuthService.create();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 50),
          _customButton(() => _actionBack(context), "Back"),
          SizedBox(height: 50),
          _customButton(() => _actionLogin(context, authService), "Login"),
        ],
      ),
    );
  }

  Widget _customButton(Function() onPressed, String text) {
    return ElevatedButton(onPressed: onPressed, child: Text(text));
  }

  _actionBack(BuildContext context) {
    Navigator.pop(context);
  }

  Future<void> _actionLogin(BuildContext context, AuthService auth) async {
    final loginInPut = LoginInPutModel(username: "user@yahoo.com", password: "12345612", deviceToken: "", deviceType: 3);
    final response = await auth.login(loginInPut);
    if (response.isSuccessful) {
      final data = (response.body as Success).value as LoginOutPutModel;
      var token = data.token;
      print("a123 success nha token is : $token");
    } else {
      print("a123 error nha");      
    }
  }
}
