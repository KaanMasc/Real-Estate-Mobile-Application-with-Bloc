part of 'ad_bloc.dart';

sealed class AdEvent extends Equatable {
  const AdEvent();

  @override
  List<Object?> get props => [];
}

class NextStepEvent extends AdEvent {
  
}

class PreviousStepEvent extends AdEvent {}

class PublishEvent extends AdEvent {}
