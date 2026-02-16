import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/styles/app_color.dart';
import 'package:news_app/core/styles/app_text_styles.dart';
import 'package:news_app/core/widgets/spacing_widget.dart';
import 'package:news_app/core/models/news_model.dart';
import 'package:news_app/features/home_screen/services/home_Screen_services.dart';
import 'package:news_app/features/home_screen/widgets/custom_category_item.dart';
import 'package:news_app/features/home_screen/widgets/top_headline_item.dart';
import 'package:news_app/features/search_result_screen/widgets/search_text_field.dart';

import '../../core/routing/app_router.dart';
import 'widgets/custom_articale_Card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> categories = [
    "Travel",
    "Technology",
    "Business",
    "Entertainment",
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color(0xffE9EEFA),
          toolbarHeight: 75.h,
          title: Padding(
            padding: EdgeInsetsDirectional.only(start: 22.w, end: 20.w),
            child: Text('explore'.tr(), style: AppTextStyles.black32),
          ),
          actions: [
            SearchTextField(),
            IconButton(
              onPressed: () {
                if(context.locale.languageCode == "en"){
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
        ),
        body: FutureBuilder(
          future: HomeScreenServices().getTopHeadlinesArticles(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: AppColor.primaryTextColor,
                ),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  snapshot.error.toString(),
                  style: AppTextStyles.black18,
                ),
              );
            }

            if (!snapshot.hasData) {
              return Center(
                child: Text("No data available", style: AppTextStyles.black18),
              );
            }

            NewsModel newsModel = snapshot.data as NewsModel;

            if (newsModel.totalResults == 0) {
              return Center(
                child: Text("No Result".tr(), style: AppTextStyles.black18),
              );
            }

            return Column(
              children: [
                const HeightSpace(18),

                Padding(
                  padding: EdgeInsetsDirectional.only(start: 32.w),
                  child: SizedBox(
                    height: 40.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return CustomCategoryItem(
                          title: categories[index].tr(),
                          isSelected: selectedIndex == index,
                          ontap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                            GoRouter.of(context).pushReplacementNamed(
                              AppRouter.searchResultsScreen,
                              extra: categories[index].tr(),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
                const HeightSpace(24),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        TopHeadlineItem(article: newsModel.articles!.first),
                        const HeightSpace(24),
                        ...List.generate(
                          newsModel.articles!.length - 1,
                          (index) => CustomArticleCard(
                            article: newsModel.articles![index + 1],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
