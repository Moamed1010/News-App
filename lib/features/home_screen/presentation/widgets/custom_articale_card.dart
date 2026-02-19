// ignore: file_names
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/models/articles_model.dart';
import 'package:news_app/core/styles/app_text_styles.dart';

import '../../../../core/routing/app_router.dart';

class CustomArticleCard extends StatelessWidget {
  final Articles article;

  const CustomArticleCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(
          context,
        ).pushReplacementNamed(AppRouter.articleDetailsScreen, extra: article);
      },
      child: Padding(
        padding: EdgeInsets.only(bottom: 24.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.title ?? "",
                    style: AppTextStyles.black18,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "${article.author ?? ""} . ${article.publishedAt ?? ""}",
                    style: AppTextStyles.gray12,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),

            SizedBox(width: 16.w),

            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                height: 80.h,
                width: 112.w,
                imageUrl:
                    article.urlToImage ??
                    "https://imgs.search.brave.com/1WzxKQxvmdqgJhAFyUUwmf_SSrWrcsUhcgMPRtmclps/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvMTE4/MzMzODQ5OC92ZWN0/b3IvMDU0Ny5qcGc_/cz02MTJ4NjEyJnc9/MCZrPTIwJmM9RWNz/YndCVmVjYWRQYXVL/aGdZZHB0NTYxblla/b3RDZEMzTHlya210/cmdwbz0",

                placeholder: (context, url) =>
                    Container(color: Colors.grey[200]),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
