
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/home_screen/presentation/cubit/home_cubit.dart';
import 'package:news_app/features/home_screen/presentation/cubit/home_state.dart';
import 'package:news_app/features/home_screen/presentation/widgets/app_bar.dart';
import 'package:news_app/features/home_screen/presentation/widgets/categories_list.dart';
import 'package:news_app/features/home_screen/presentation/widgets/news_list.dart';
import '../../../core/widgets/spacing_widget.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});


  static const List<String> categories = [
    "Travel",
    "Technology",
    "Business",
    "Entertainment",
  ];

  @override
  Widget build(BuildContext context) {
 

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppBar(context),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is LoadingTopHeadlineState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ErrorTopHeadlineState) {
              return Center(child: Text(state.error));
            } else if (state is SuccessTopHeadLineState) {
              final newsData = state.topHeadline;

              return Column(
                children: [
                  const HeightSpace(18),
                  buildCategoriesList(categories),
                  const HeightSpace(24),
                  buildNewsList(newsData),
                ],
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

}
  

