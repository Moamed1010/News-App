import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:news_app/core/routing/app_router.dart';
import 'package:news_app/core/styles/app_text_styles.dart';
import 'package:news_app/core/widgets/spacing_widget.dart';
import 'package:news_app/features/home_screen/domain/entity/article_entity.dart';

class TopHeadlineItem extends StatelessWidget {
  final ArticleEntity article;
  const TopHeadlineItem({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(
          context,
        ).pushReplacementNamed(AppRouter.articleDetailsScreen, extra: article);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(8.r),
            child: CachedNetworkImage(
              height: 209.h,
              width: double.infinity,
              fit: BoxFit.cover,
              imageUrl:
                  article.urlToImage ??
                  "https://imgs.search.brave.com/1WzxKQxvmdqgJhAFyUUwmf_SSrWrcsUhcgMPRtmclps/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvMTE4/MzMzODQ5OC92ZWN0/b3IvMDU0Ny5qcGc_/cz02MTJ4NjEyJnc9/MCZrPTIwJmM9RWNz/YndCVmVjYWRQYXVL/aGdZZHB0NTYxblla/b3RDZEMzTHlya210/cmdwbz0",
            ),
          ),
          const HeightSpace(16),
          Text(article.title ?? "", style: AppTextStyles.black18, maxLines: 2),
          const HeightSpace(12),
          Text(
            "${article.author ?? ""} . ${article.publishedAt ?? ""}",
            style: AppTextStyles.gray12,
          ),
        ],
      ),
    );
  }
}
