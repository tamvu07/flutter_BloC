import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 50),
          _customButton(() => _actionBack(context), "Back"),
          SizedBox(height: 50),
          _customButton(() => _actionLogin(context), "Login"),
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

  _actionLogin(BuildContext context) {

  }
}
