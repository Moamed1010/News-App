import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/core/models/news_model.dart';
import 'package:news_app/features/search_result_screen/repo/search_result_repo.dart';

part 'search_result_state.dart';

class SearchResultCubit extends Cubit<SearchResultState> {
  SearchResultCubit() : super(SearchResultInitial());

  final SearchResultRepo resultRepo = SearchResultRepo();

  Future<void> searchItemByName(String query) async {
    emit(LoadingSearchResult());

    try {
      final response = await resultRepo.searchItemByName(query);

      emit(SuccessSearchResult(response));
    } catch (e) {
      emit(ErrorSearchResult(e.toString()));
    }
  }
}
