import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:news_app/core/models/articles_model.dart';
import 'package:news_app/core/routing/app_router.dart';
import 'package:news_app/core/styles/app_color.dart';
import 'package:news_app/core/styles/app_text_styles.dart';

class ArticleDetailsScreen extends StatelessWidget {
  final Articles article;
  const ArticleDetailsScreen({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            // استخدمنا Column لتقسيم الشاشة: صورة فوق ومحتوى تحت
            Column(
              children: [
                // 1. الصورة (تأخذ مساحة ثابتة ولن يغطيها أحد)
                SizedBox(
                  width: double.infinity,
                  height: 300.h, // ارتفاع الصورة الثابت
                  child: CachedNetworkImage(
                    imageUrl: article.urlToImage ?? "",
                    fit: BoxFit.cover,
                    placeholder: (context, url) =>
                        Container(color: Colors.grey[200]),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),

                // 2. المحتوى الأبيض (يأخذ باقي الشاشة والسكرول بداخله فقط)
                Expanded(
                  child: Container(
                    width: double.infinity,
                    // رفعنا الكونتينر بالسالب (-20) عشان يعمل تداخل بسيط وشيك مع الصورة
                    transform: Matrix4.translationValues(0.0, -20.0, 0.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30.r),
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30.r),
                      ),
                      child: SingleChildScrollView(
                        padding: EdgeInsets.only(
                          top: 30.h,
                          left: 20.w,
                          right: 20.w,
                          bottom: 20.h,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              article.title ?? "",
                              style: AppTextStyles.black18.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 16.h),
                            Text(
                              "${article.author ?? 'Unknown'} . ${article.publishedAt != null ? DateFormat("yyyy-MM-dd").format(article.publishedAt!) : ''}",
                              style: AppTextStyles.gray12,
                            ),
                            SizedBox(height: 24.h),
                            Text(
                              article.content ?? "No content available.",
                              style: AppTextStyles.black16.copyWith(
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Positioned(
              top: 20.h,
              left: 20.w,
              child: CircleAvatar(
                backgroundColor: Colors.white.withOpacity(0.5),
                child: IconButton(
                  onPressed: () {
                    GoRouter.of(
                      context,
                    ).pushReplacementNamed(AppRouter.homeScreen);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new_outlined,
                    size: 20.sp,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
