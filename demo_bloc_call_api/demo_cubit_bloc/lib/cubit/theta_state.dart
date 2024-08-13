part of 'theta_cubit.dart';

sealed class ThetaState extends Equatable {
  const ThetaState();

  @override
  List<Object> get props => [];
}

class ThetaInitial extends ThetaState {
  final String responseText;
  const ThetaInitial(this.responseText);

   @override
  List<Object> get props => [responseText];
}

class ThetaLoading extends ThetaState {
  const ThetaLoading();
}

class ThetaLoaded extends ThetaState {
  final String responseText;
  const ThetaLoaded(this.responseText);

   @override
  List<Object> get props => [responseText];
}