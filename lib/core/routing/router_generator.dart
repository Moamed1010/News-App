import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/dependency_injection/service_locator.dart';
import 'package:news_app/features/home_screen/domain/entity/article_entity.dart';
import 'package:news_app/features/home_screen/presentation/article_details_screen.dart';
import 'package:news_app/features/home_screen/presentation/cubit/home_cubit.dart';
import 'package:news_app/features/home_screen/presentation/home_screen.dart';
import 'package:news_app/features/search_result_screen/presentation/cubit/search_result_cubit.dart';
import 'package:news_app/features/search_result_screen/presentation/search_result_screen.dart';

import 'app_router.dart';

class RouterGenerator {
  static GoRouter goRouter = GoRouter(
    initialLocation: AppRouter.homeScreen,
    routes: [
      GoRoute(
        path: AppRouter.homeScreen,
        name: AppRouter.homeScreen,
        builder: (context, state) => BlocProvider(
         
          create: (context) => getIt<HomeCubit>()..getTopHeadline(),
          child: const HomeScreen(),
        ),
      ),


      GoRoute(
        path: AppRouter.searchResultsScreen,
        name: AppRouter.searchResultsScreen,
        builder: (context, state) {
          String query = state.extra as String;
          return BlocProvider(
       
            create: (context) =>
                getIt<SearchResultCubit>()..searchItemByName(query),
            child: SearchResultScreen(query: query),
          );
        },
      ),


      GoRoute(
        path: AppRouter.articleDetailsScreen,
        name: AppRouter.articleDetailsScreen,
        builder: (context, state) {
       
          ArticleEntity article = state.extra as ArticleEntity;
          return ArticleDetailsScreen(article: article);
        },
      ),
    ],
  );
}
