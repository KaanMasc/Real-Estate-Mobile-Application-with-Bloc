part of 'post_ad_bloc.dart';

sealed class PostAdStates extends Equatable {
  const PostAdStates();

  @override
  List<Object> get props => [];
}

final class StepOne extends PostAdStates {
  @override
  List<Object> get props => [];
}

final class StepTwo extends PostAdStates {}

final class StepThree extends PostAdStates {}

final class StepFour extends PostAdStates {}

final class PostzieLoading extends PostAdStates {}

final class PostzieSucces extends PostAdStates {}

final class PostzieError extends PostAdStates {}
