part of 'post_ad_bloc.dart';

sealed class PostAdEvent extends Equatable {
  const PostAdEvent();

  @override
  List<Object> get props => [];
}

class NextPageEvent extends PostAdEvent {
  const NextPageEvent();

  @override
  List<Object> get props => [];
}

class PreviousPageEvent extends PostAdEvent {
  const PreviousPageEvent();

  @override
  List<Object> get props => [];
}
class PublishDataEvent extends PostAdEvent {
  const PublishDataEvent();

  @override
  List<Object> get props => [];
}
