part of 'search_result_cubit.dart';

@immutable
abstract class SearchResultState {}

class SearchResultInitial extends SearchResultState {}

class LoadingSearchResult extends SearchResultState {}

class SuccessSearchResult extends SearchResultState {
  final NewsModel model;
  SuccessSearchResult(this.model);
}

class ErrorSearchResult extends SearchResultState { // تم تصحيح Erorr إلى Error
  final String error;
  ErrorSearchResult(this.error);
}