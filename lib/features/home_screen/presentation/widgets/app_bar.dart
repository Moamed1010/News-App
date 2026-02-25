import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/styles/app_color.dart';
import 'package:news_app/features/search_result_screen/presentation/widgets/search_text_field.dart';

import '../../../../core/styles/app_text_styles.dart';

AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xffE9EEFA),
      toolbarHeight: 75.h,
      title: Padding(
        padding: EdgeInsetsDirectional.only(start: 22.w, end: 20.w),
        child: Text('explore'.tr(), style: AppTextStyles.black32),
      ),
      actions: [
        const SearchTextField(),
        IconButton(
          onPressed: () {
            context.setLocale(
              context.locale.languageCode == "en"
                  ? const Locale("ar")
                  : const Locale("en"),
            );
          },
          icon: Icon(
            Icons.language,
            color: AppColor.primaryTextColor,
            size: 24.sp,
          ),
        ),
      ],
    );
  }