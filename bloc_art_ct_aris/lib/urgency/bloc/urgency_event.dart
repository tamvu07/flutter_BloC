part of 'urgency_bloc.dart';


abstract class UrgencyEvent extends Equatable {
  const UrgencyEvent();

  @override
  List<Object?> get props => [];
}

class StartUrgencyEvent extends UrgencyEvent {
  
}