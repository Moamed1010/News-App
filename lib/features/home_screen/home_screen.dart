import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/styles/app_text_styles.dart';
import 'package:news_app/core/widgets/spacing_widget.dart';
import 'package:news_app/features/home_screen/widgets/custom_category_item.dart';
import 'package:news_app/features/home_screen/widgets/top_headline_item.dart';

import 'widgets/custom_articale_Card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> categories = [
    "travel",
    "technology",
    "business",
    "entertainment",
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffE9EEFA),
          toolbarHeight: 100.h,
          title: Padding(
            padding: EdgeInsetsDirectional.only(start: 22.w, end: 20.w),
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
            const HeightSpace(18),
            // قسم التصنيفات (Fixed Height)
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
            const HeightSpace(24),

            // التعديل هنا: أضفنا Expanded ليملأ باقي الشاشة
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  children: [
                    TopHeadlineItem(
                      imageUrl:
                          "https://imgs.search.brave.com/eK6x2NfP-nNqdwWp7Up91pA8MIeWUGpzMwPjaSZrJJw/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5jbm4uY29tL2Fw/aS92MS9pbWFnZXMv/c3RlbGxhci9wcm9k/L2NubmhlYWRsaW5l/cy13ZWJkdGMtMXgx/LmpwZz9jPTE2eDkm/cT13XzEyODAsY19m/aWxs",
                      title: "Apple Unveils Revolutionary AI Features ",
                      publishedAt: "May 1,2026",
                      authorName: "Moamed",
                    ),
                    const HeightSpace(24),
                    // القائمة تأخذ المساحة المتبقية داخل الـ Expanded الأب
                    Expanded(
                      child: ListView(
                        // يفضل إضافة physics هنا أيضاً لتجربة مستخدم أفضل
                        physics: const BouncingScrollPhysics(),
                        children: const [
                          CustomArticaleCard(
                            imageUrl:
                                "https://imgs.search.brave.com/eK6x2NfP-nNqdwWp7Up91pA8MIeWUGpzMwPjaSZrJJw/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5jbm4uY29tL2Fw/aS92MS9pbWFnZXMv/c3RlbGxhci9wcm9k/L2NubmhlYWRsaW5l/cy13ZWJkdGMtMXgx/LmpwZz9jPTE2eDkm/cT13XzEyODAsY19m/aWxs",
                            title: "Apple Unveils Revolutionary AI Features ",
                            publishedAt: "May 1,2026",
                            authorName: "Moamed",
                          ),
                          CustomArticaleCard(
                            imageUrl:
                                "https://imgs.search.brave.com/eK6x2NfP-nNqdwWp7Up91pA8MIeWUGpzMwPjaSZrJJw/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5jbm4uY29tL2Fw/aS92MS9pbWFnZXMv/c3RlbGxhci9wcm9k/L2NubmhlYWRsaW5l/cy13ZWJkdGMtMXgx/LmpwZz9jPTE2eDkm/cT13XzEyODAsY19m/aWxs",
                            title: "Apple Unveils Revolutionary AI Features ",
                            publishedAt: "May 1,2026",
                            authorName: "Moamed",
                          ),
                          CustomArticaleCard(
                            imageUrl:
                                "https://imgs.search.brave.com/eK6x2NfP-nNqdwWp7Up91pA8MIeWUGpzMwPjaSZrJJw/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5jbm4uY29tL2Fw/aS92MS9pbWFnZXMv/c3RlbGxhci9wcm9k/L2NubmhlYWRsaW5l/cy13ZWJkdGMtMXgx/LmpwZz9jPTE2eDkm/cT13XzEyODAsY19m/aWxs",
                            title: "Apple Unveils Revolutionary AI Features ",
                            publishedAt: "May 1,2026",
                            authorName: "Moamed",
                          ),
                          CustomArticaleCard(
                            imageUrl:
                                "https://imgs.search.brave.com/eK6x2NfP-nNqdwWp7Up91pA8MIeWUGpzMwPjaSZrJJw/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5jbm4uY29tL2Fw/aS92MS9pbWFnZXMv/c3RlbGxhci9wcm9k/L2NubmhlYWRsaW5l/cy13ZWJkdGMtMXgx/LmpwZz9jPTE2eDkm/cT13XzEyODAsY19m/aWxs",
                            title: "Apple Unveils Revolutionary AI Features ",
                            publishedAt: "May 1,2026",
                            authorName: "Moamed",
                          ),
                          CustomArticaleCard(
                            imageUrl:
                                "https://imgs.search.brave.com/eK6x2NfP-nNqdwWp7Up91pA8MIeWUGpzMwPjaSZrJJw/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5jbm4uY29tL2Fw/aS92MS9pbWFnZXMv/c3RlbGxhci9wcm9k/L2NubmhlYWRsaW5l/cy13ZWJkdGMtMXgx/LmpwZz9jPTE2eDkm/cT13XzEyODAsY19m/aWxs",
                            title: "Apple Unveils Revolutionary AI Features ",
                            publishedAt: "May 1,2026",
                            authorName: "Moamed",
                          ),
                          CustomArticaleCard(
                            imageUrl:
                                "https://imgs.search.brave.com/eK6x2NfP-nNqdwWp7Up91pA8MIeWUGpzMwPjaSZrJJw/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5jbm4uY29tL2Fw/aS92MS9pbWFnZXMv/c3RlbGxhci9wcm9k/L2NubmhlYWRsaW5l/cy13ZWJkdGMtMXgx/LmpwZz9jPTE2eDkm/cT13XzEyODAsY19m/aWxs",
                            title: "Apple Unveils Revolutionary AI Features ",
                            publishedAt: "May 1,2026",
                            authorName: "Moamed",
                          ),
                          CustomArticaleCard(
                            imageUrl:
                                "https://imgs.search.brave.com/eK6x2NfP-nNqdwWp7Up91pA8MIeWUGpzMwPjaSZrJJw/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5jbm4uY29tL2Fw/aS92MS9pbWFnZXMv/c3RlbGxhci9wcm9k/L2NubmhlYWRsaW5l/cy13ZWJkdGMtMXgx/LmpwZz9jPTE2eDkm/cT13XzEyODAsY19m/aWxs",
                            title: "Apple Unveils Revolutionary AI Features ",
                            publishedAt: "May 1,2026",
                            authorName: "Moamed",
                          ),
                          CustomArticaleCard(
                            imageUrl:
                                "https://imgs.search.brave.com/eK6x2NfP-nNqdwWp7Up91pA8MIeWUGpzMwPjaSZrJJw/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5jbm4uY29tL2Fw/aS92MS9pbWFnZXMv/c3RlbGxhci9wcm9k/L2NubmhlYWRsaW5l/cy13ZWJkdGMtMXgx/LmpwZz9jPTE2eDkm/cT13XzEyODAsY19m/aWxs",
                            title: "Apple Unveils Revolutionary AI Features ",
                            publishedAt: "May 1,2026",
                            authorName: "Moamed",
                          ),
                          CustomArticaleCard(
                            imageUrl:
                                "https://imgs.search.brave.com/eK6x2NfP-nNqdwWp7Up91pA8MIeWUGpzMwPjaSZrJJw/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5jbm4uY29tL2Fw/aS92MS9pbWFnZXMv/c3RlbGxhci9wcm9k/L2NubmhlYWRsaW5l/cy13ZWJkdGMtMXgx/LmpwZz9jPTE2eDkm/cT13XzEyODAsY19m/aWxs",
                            title: "Apple Unveils Revolutionary AI Features ",
                            publishedAt: "May 1,2026",
                            authorName: "Moamed",
                          ),
                          CustomArticaleCard(
                            imageUrl:
                                "https://imgs.search.brave.com/eK6x2NfP-nNqdwWp7Up91pA8MIeWUGpzMwPjaSZrJJw/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5jbm4uY29tL2Fw/aS92MS9pbWFnZXMv/c3RlbGxhci9wcm9k/L2NubmhlYWRsaW5l/cy13ZWJkdGMtMXgx/LmpwZz9jPTE2eDkm/cT13XzEyODAsY19m/aWxs",
                            title: "Apple Unveils Revolutionary AI Features ",
                            publishedAt: "May 1,2026",
                            authorName: "Moamed",
                          ),
                          CustomArticaleCard(
                            imageUrl:
                                "https://imgs.search.brave.com/eK6x2NfP-nNqdwWp7Up91pA8MIeWUGpzMwPjaSZrJJw/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5jbm4uY29tL2Fw/aS92MS9pbWFnZXMv/c3RlbGxhci9wcm9k/L2NubmhlYWRsaW5l/cy13ZWJkdGMtMXgx/LmpwZz9jPTE2eDkm/cT13XzEyODAsY19m/aWxs",
                            title: "Apple Unveils Revolutionary AI Features ",
                            publishedAt: "May 1,2026",
                            authorName: "Moamed",
                          ),
                          // ... باقي العناصر
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
