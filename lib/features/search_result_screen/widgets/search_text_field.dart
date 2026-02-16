import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/widgets/custom_textt_field.dart';

import '../../../core/routing/app_router.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({super.key});

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  bool showTextForm = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        showTextForm
            ? Padding(
                padding: EdgeInsets.symmetric(vertical: 12.h),
                child: CustomTextField(
                  width: 190.w,
                  hintText: "search".tr(),
                  onSubmitted: (value) {
                    GoRouter.of(context).pushReplacementNamed(
                      AppRouter.searchResultsScreen,
                      extra: value,
                    );
                  },
                ),
              )
            : const SizedBox.shrink(),
        IconButton(
          onPressed: () {
            setState(() {
              showTextForm = !showTextForm;
            });
          },
          icon: Icon(Icons.search, color: Colors.black, size: 28.sp),
        ),
      ],
    );
  }
}
