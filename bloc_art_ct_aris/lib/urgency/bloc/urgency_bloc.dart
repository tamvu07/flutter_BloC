import 'package:bloc/bloc.dart';
import 'package:bloc_art_ct_aris/login/bloc/login_bloc.dart';
import 'package:bloc_art_ct_aris/urgency/services/urgency_service.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'urgency_event.dart';
part 'urgency_state.dart';

class UrgencyBloc extends Bloc<UrgencyEvent, LoginState> {
  UrgencyBloc({required UrgencyService urgencyService}) : _service =  urgencyService, super(LoginState.initial()) {

    on<StartUrgencyEvent>(_onStartUrgencyEvent);
  }

  final UrgencyService _service;

  Future<void> _onStartUrgencyEvent(
      StartUrgencyEvent event,
      Emitter<LoginState> emit,
    ) async {
         emit(const LoginState.loading());
         // then((value) => {} đây là cơ chế của hàm future<> trong flutter
         await _service.getUrgency().then((value) => {
          //  value.when() la của freezed
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