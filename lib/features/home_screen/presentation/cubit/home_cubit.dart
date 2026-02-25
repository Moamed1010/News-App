import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/home_screen/domain/use_cases/get_news_usecase.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {

  final GetNewsUseCase getNewsUseCase;

  HomeCubit(this.getNewsUseCase) : super(HomeInitialState());

  Future<void> getTopHeadline() async {
    emit(LoadingTopHeadlineState());

    
    final result = await getNewsUseCase.call();

    result.fold(
      (error) => emit(ErrorTopHeadlineState(error.toString())),
      (newsEntity) => emit(SuccessTopHeadLineState(newsEntity)),
    );
  }
}
