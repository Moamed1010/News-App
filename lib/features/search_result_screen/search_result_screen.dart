import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/routing/app_router.dart';
import 'package:news_app/core/styles/app_text_styles.dart';
import 'package:news_app/features/search_result_screen/services/search_result_services.dart';

import '../../core/models/news_model.dart';
import '../../core/styles/app_color.dart';
import '../../core/widgets/spacing_widget.dart';
import '../home_screen/widgets/custom_articale_Card.dart';

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
        body: FutureBuilder(
          future: SearchResultServices().searchItemByName(query),
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
            if (snapshot.hasData) {
              NewsModel searchResult = snapshot.data! as NewsModel;

              if (searchResult.totalResults == 0) {
                return Center(
                  child: Text("No Result".tr(), style: AppTextStyles.black18),
                );
              }
              return Column(
                children: [
                  const HeightSpace(22),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Column(
                        children: [
                          const HeightSpace(24),
                          Expanded(
                            child: ListView.builder(
                              itemCount: searchResult.articles!.length,
                              itemBuilder: (context, index) {
                                return CustomArticleCard(
                                  article: searchResult.articles![index],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }

            return Center(
              child: Text("No data available", style: AppTextStyles.black18),
            );
          },
        ),
      ),
    );
  }
}
