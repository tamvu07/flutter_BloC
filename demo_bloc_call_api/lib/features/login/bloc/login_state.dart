

import 'package:flutter/cupertino.dart';

@immutable
abstract class LoginState {}

class InitLoginState extends LoginState {}

class StartLoginState extends LoginState {}

class LoadingLoginState extends LoginState {}

class SuccessLoginState extends LoginState {}

class ErrorLoginState extends LoginState {}