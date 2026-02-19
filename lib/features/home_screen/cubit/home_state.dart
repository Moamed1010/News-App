part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitialState extends HomeState {}

class LoadingTopHeadlineState extends HomeState {}

class SuccessTopHeadLineState extends HomeState {
  final NewsModel topHeadline;

  SuccessTopHeadLineState(this.topHeadline);
}

class ErrorTopHeadlineState extends HomeState {
  final String error;

  ErrorTopHeadlineState(this.error);
}
