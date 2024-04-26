

import 'dart:async';

import 'package:bloc/bloc.dart';

import '../auth/auth_service.dart';
import '../auth/model_converter.dart';
import '../auth/viewmodel/LoginOutPutModel.dart';
import '../auth/viewmodel/loginInPutModel.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {

  final AuthService authService = AuthService.create();

  LoginBloc() : super(InitLoginState()) {
    on<StartLoginEvent>(startLogin);
  }

  FutureOr<void> startLogin(
      StartLoginEvent event, Emitter<LoginState> emit) async {

    final loginInPut = LoginInPutModel(username: "user@yahoo.com", password: "12345612", deviceToken: "", deviceType: 3);

    emit(LoadingLoginState());

    final response = await authService.login(loginInPut);
    if (response.isSuccessful) {
      final data = (response.body as Success).value as LoginOutPutModel;
      var token = data.token;
      print("a123 success nha token is : $token");
      emit(SuccessLoginState());
    } else {
      print("a123 error nha");
      emit(ErrorLoginState());
    }
  }

}