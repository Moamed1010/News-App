import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/styles/app_text_styles.dart';
import 'package:news_app/core/widgets/spacing_widget.dart';
import 'package:news_app/features/home_screen/widgets/custom_category_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // 1. قائمة الأقسام (keys for translation)
  final List<String> categories = [
    "travel",
    "technology",
    "business",
    "entertainment",
    "health", // أضفت واحد زيادة للتجربة
    "science",
  ];

  // 2. متغير لحفظ رقم العنصر المختار (نبدأ بـ 0 ليكون الأول مختاراً)
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffE9EEFA),
          toolbarHeight: 100.h,
          title: Padding(
            padding: EdgeInsetsDirectional.only(start: 28.w, end: 20.w),
            child: Text('explore'.tr(), style: AppTextStyles.black32),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.search, color: Colors.black, size: 28.sp),
            ),
          ],
        ),
        body: Column(
          children: [
            const HeightSpace(16),
            Padding(
              padding: EdgeInsetsDirectional.only(start: 32.w),
              child: SizedBox(
                height: 40.h,

                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return CustomCategoryItem(
                      title: categories[index],

                      isSelected: selectedIndex == index,

                      ontap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
