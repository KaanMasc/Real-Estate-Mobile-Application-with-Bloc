part of 'ad_bloc.dart';

sealed class AdState extends Equatable {
  const AdState();

  @override
  List<Object?> get props => [];
}

class StepOneState extends AdState {
  @override
  List<Object?> get props => [];
}

class StepTwoState extends AdState {
  @override
  List<Object?> get props => [];
}

class StepThreeState extends AdState {
  @override
  List<Object?> get props => [];
}

class StepFourState extends AdState {
  @override
  List<Object?> get props => [];
}

class StepFiveState extends AdState {
  @override
  List<Object?> get props => [];
}

final class AdInitial extends AdState {}

final class AdSuccess extends AdState {
  final String message;

  const AdSuccess(this.message);

  @override
  List<Object?> get props => [message];
}

final class AdFailure extends AdState {
  final String errorMessage;

  const AdFailure(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
