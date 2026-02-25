import 'package:get_it/get_it.dart';
import 'package:news_app/features/home_screen/data/data_source/home_repo_data_source.dart';
import 'package:news_app/features/home_screen/data/repo/home_repo_impl.dart';
import 'package:news_app/features/home_screen/domain/reop/get_article_repo.dart';
import 'package:news_app/features/home_screen/domain/use_cases/get_news_usecase.dart';
import 'package:news_app/features/home_screen/presentation/cubit/home_cubit.dart';
import 'package:news_app/features/search_result_screen/presentation/cubit/search_result_cubit.dart';
import 'package:news_app/features/search_result_screen/data/data_source/search_remote_data_sourc.dart';
import 'package:news_app/features/search_result_screen/data/repo/search_repo_impl.dart';
import 'package:news_app/features/search_result_screen/domain/reop/search_repo.dart';
import 'package:news_app/features/search_result_screen/domain/use_case/search_usecase.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {



  getIt.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(),
  );


  getIt.registerLazySingleton<NewsRepository>(
    () => HomeRepoImpl(getIt<HomeRemoteDataSource>()),
  );


  getIt.registerLazySingleton(() => GetNewsUseCase(getIt<NewsRepository>()));

  
  getIt.registerFactory(() => HomeCubit(getIt<GetNewsUseCase>()));



  getIt.registerLazySingleton<SearchRemoteDataSource>(
    () => SearchRemoteDataSourceImpl(),
  );


  getIt.registerLazySingleton<SearchRepo>(
    () => SearchRepoImpl(getIt<SearchRemoteDataSource>()),
  );


  getIt.registerLazySingleton(() => SearchArticlesUseCase(getIt<SearchRepo>()));


  getIt.registerFactory(
    () => SearchResultCubit(getIt<SearchArticlesUseCase>()),
  );
}
