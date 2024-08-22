import 'package:bloc/bloc.dart';
import 'package:bloc_art_ct_aris/common/error/app_error.dart';
import 'package:bloc_art_ct_aris/login/models/in_put/login_in_put_model.dart';
import 'package:bloc_art_ct_aris/login/models/login_response.dart';
import 'package:bloc_art_ct_aris/login/models/out_put/login_out_put_model.dart';
import 'package:bloc_art_ct_aris/login/services/login_service.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({required LoginService loginService}) : _service =  loginService, super(LoginState.initial()) {
    on<StartLoginEvent>(_onStartLoginEvent);
  }

final LoginService _service;

  Future<void> _onStartLoginEvent(
      StartLoginEvent event,
      Emitter<LoginState> emit,
    ) async {
      emit(LoginState.loading());
      await _service.login(event.username, event.password, 3, "").then((value) => {
        value.when(
          success: (data) => {
            emit(LoginState.success(data!))
          },
          failure: (e) {
            emit(LoginState.error(e));
          }
          )
      });
    }
}
