part of 'login_bloc.dart';

enum LoginStatus { initial, loading, success, failure }

// @immutable
// sealed class LoginState {}

final class LoginState<T> extends Equatable {
  final LoginStatus status;
  final T? data;
  final AppError? error;
  
  @override
  // TODO: implement props
  List<Object?> get props => [status, data, error];

  const LoginState._({
    this.status = LoginStatus.initial,
    this.data,
    this.error
  });

  const LoginState.initial(): this._();
  const LoginState.loading(): this._(status: LoginStatus.loading);
  const LoginState.success(T data): this._(status: LoginStatus.success, data: data);
  const LoginState.error(AppError error): this._(status: LoginStatus.failure, error: error);
}
