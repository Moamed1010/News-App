import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:news_app/features/home_screen/domain/entity/news_entity.dart';
import 'package:news_app/features/search_result_screen/domain/use_case/search_usecase.dart';

part 'search_result_state.dart';

class SearchResultCubit extends Cubit<SearchResultState> {
  final SearchArticlesUseCase searchArticlesUseCase;

  SearchResultCubit(this.searchArticlesUseCase) : super(SearchResultInitial());

  Future<void> searchItemByName(String query) async {
    emit(LoadingSearchResult());

    final result = await searchArticlesUseCase.call(query);

    result.fold(
      (failure) => emit(ErrorSearchResult(failure.message)),
      (newsEntity) => emit(SuccessSearchResult(newsEntity)),
    );
  }
}
