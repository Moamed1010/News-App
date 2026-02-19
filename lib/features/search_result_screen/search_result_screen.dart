import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/routing/app_router.dart';
import 'package:news_app/core/styles/app_text_styles.dart';
import 'package:news_app/features/home_screen/presentation/widgets/custom_articale_card.dart';
import 'package:news_app/features/search_result_screen/cubit/search_result_cubit.dart';
import '../../core/models/news_model.dart';
import '../../core/styles/app_color.dart';
import '../../core/widgets/spacing_widget.dart';

class SearchResultScreen extends StatelessWidget {
  final String query;
  const SearchResultScreen({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                if (context.locale.languageCode == "en") {
                  context.setLocale(const Locale("ar"));
                } else {
                  context.setLocale(const Locale("en"));
                }
              },
              icon: Icon(
                Icons.language,
                color: AppColor.primaryTextColor,
                size: 24.sp,
              ),
            ),
          ],
          leading: IconButton(
            onPressed: () {
              GoRouter.of(context).pushReplacementNamed(AppRouter.homeScreen);
            },
            icon: Icon(Icons.arrow_back_ios, color: Colors.black, size: 14.sp),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          title: Text("search_result".tr(), style: AppTextStyles.black24),
        ),
        body: BlocBuilder<SearchResultCubit, SearchResultState>(
          builder: (context, state) {
            if (state is LoadingSearchResult) {
              return Center(
                child: CircularProgressIndicator(
                  color: AppColor.primaryTextColor,
                ),
              );
            } else if (state is ErrorSearchResult) {
              return Center(child: Text(state.error));
            } else if (state is SuccessSearchResult) {
              NewsModel searchResult = state.model;
              if (searchResult.articles == null ||
                  searchResult.articles!.isEmpty) {
                return Center(child: Text("No Result".tr()));
              }

              return Column(
                children: [
                  const HeightSpace(22),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: ListView.builder(
                        itemCount: searchResult.articles!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(bottom: 10.h),
                            child: CustomArticleCard(
                              article: searchResult.articles![index],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
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
