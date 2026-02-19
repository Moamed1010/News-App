import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app/core/models/news_model.dart';
import 'package:news_app/features/home_screen/repo/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  final HomeRepo homeRepo = HomeRepo();

  Future<void> getTopHeadline() async {
    emit(LoadingTopHeadlineState());

    try {
      final response = await homeRepo.getTopHeadlinesArticles();
      emit(SuccessTopHeadLineState(response));
    } catch (e) {
      emit(ErrorTopHeadlineState(e.toString()));
    }
  }
}
