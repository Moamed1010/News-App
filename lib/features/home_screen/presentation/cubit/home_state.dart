
import '../../domain/entity/news_entity.dart';

abstract class HomeState {}

class HomeInitialState extends HomeState {}

class LoadingTopHeadlineState extends HomeState {}

class SuccessTopHeadLineState extends HomeState {

  final NewsEntity topHeadline;

  SuccessTopHeadLineState(this.topHeadline);
}

class ErrorTopHeadlineState extends HomeState {
  final String error;

  ErrorTopHeadlineState(this.error);
}