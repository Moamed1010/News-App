import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/models/articles_model.dart';
import 'package:news_app/features/home_screen/home_screen.dart';
import '../../features/home_screen/article_details_screen.dart';
import '../../features/search_result_screen/search_result_screen.dart';
import 'app_router.dart';

class RouterGenerator {
  static GoRouter goRouter = GoRouter(
    initialLocation: AppRouter.homeScreen,
    routes: [
      GoRoute(
        path: AppRouter.homeScreen,
        name: AppRouter.homeScreen,
        builder: (context, state) => const HomeScreen(),
      ),

      GoRoute(
        path: AppRouter.searchScreen,
        name: AppRouter.searchScreen,
        builder: (context, state) => Container(),
      ),

      GoRoute(
        path: AppRouter.searchResultsScreen,
        name: AppRouter.searchResultsScreen,
        builder: (context, state) {
          String query = state.extra as String;
          return SearchResultScreen(query: query);
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
