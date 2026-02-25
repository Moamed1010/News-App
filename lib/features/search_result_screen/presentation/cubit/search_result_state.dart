part of 'search_result_cubit.dart';

@immutable
abstract class SearchResultState {}

class SearchResultInitial extends SearchResultState {}

class LoadingSearchResult extends SearchResultState {}

class SuccessSearchResult extends SearchResultState {

  final NewsEntity newsEntity;
  SuccessSearchResult(this.newsEntity);
}

class ErrorSearchResult extends SearchResultState {
  final String error;
  ErrorSearchResult(this.error);
}