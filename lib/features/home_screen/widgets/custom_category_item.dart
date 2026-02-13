import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/styles/app_text_styles.dart';

class CustomCategoryItem extends StatelessWidget {
  final String title;
  final VoidCallback? ontap;
  final bool? isSelected;
  const CustomCategoryItem({
    super.key,
    required this.title,
    this.ontap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(end: 12.w),
      child: InkWell(
        borderRadius: BorderRadius.circular(56.r),
        onTap: ontap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 0.h),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xffE9EEFA), width: 1),
            borderRadius: BorderRadius.circular(56.r),
            color: isSelected == true ? Color(0xffE9EEFA) : Colors.transparent,
          ),
          child: Text(title.tr(), style: AppTextStyles.black14),
        ),
      ),
    );
  }
}
