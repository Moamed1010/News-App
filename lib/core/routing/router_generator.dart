import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/features/home_screen/home_screen.dart';

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
        builder: (context, state) => Container(),
      ),

      GoRoute(
        path: AppRouter.articleDetailsScreen,
        name: AppRouter.articleDetailsScreen,
        builder: (context, state) => Container(),
      ),
    ],
  );
}
