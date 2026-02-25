import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:easy_localization/easy_localization.dart'; 
import 'package:news_app/core/routing/app_router.dart';
import 'package:news_app/features/home_screen/presentation/widgets/custom_category_item.dart';

Widget buildCategoriesList(List<String> categories) {
    return Padding(
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
              isSelected: false,
              ontap: () {
                GoRouter.of(context).pushNamed(
                  AppRouter.searchResultsScreen,
                  extra: categories[index],
                );
              },
            );
          },
        ),
      ),
    );
  }