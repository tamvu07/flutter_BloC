
import 'package:flutter/cupertino.dart';

@immutable
abstract class LoginEvent {}


class StartLoginEvent extends LoginEvent{
  final String username;
  final String password;

  StartLoginEvent(this.username,this.password);
}