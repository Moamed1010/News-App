import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/models/articles_model.dart';
import 'package:news_app/features/home_screen/cubit/home_cubit.dart';
import 'package:news_app/features/home_screen/presentation/home_screen.dart';
import 'package:news_app/features/search_result_screen/cubit/search_result_cubit.dart';
import '../../features/home_screen/presentation/article_details_screen.dart';
import '../../features/search_result_screen/search_result_screen.dart';
import 'app_router.dart';

class RouterGenerator {
  static GoRouter goRouter = GoRouter(
    initialLocation: AppRouter.homeScreen,
    routes: [
      GoRoute(
        path: AppRouter.homeScreen,
        name: AppRouter.homeScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => HomeCubit()..getTopHeadline(), // You might want to fetch home data here too if needed
          child: const HomeScreen(),
        ),
      ),
      GoRoute(
        path: AppRouter.searchResultsScreen,
        name: AppRouter.searchResultsScreen,
        builder: (context, state) {
          String query = state.extra as String;
          return BlocProvider(
            create: (context) => SearchResultCubit()..searchItemByName(query),
            child: SearchResultScreen(query: query),
          );
        },
      ),
      GoRoute(
        path: AppRouter.articleDetailsScreen,
        name: AppRouter.articleDetailsScreen,
        builder: (context, state) {
          Articles article = state.extra as Articles;
          return ArticleDetailsScreen(article: article);
        },
      ),
    ],
  );
}