import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/styles/app_text_styles.dart';
import 'package:news_app/core/widgets/spacing_widget.dart';

class TopHeadlineItem extends StatelessWidget {
  final String title;
  final String? imageUrl;
  final String publishedAt;
  final String authorName;
  const TopHeadlineItem({
    super.key,
    required this.title,
    this.imageUrl,
    required this.publishedAt,
    required this.authorName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(8.r),
          child: CachedNetworkImage(
            height: 209.h,
            width: double.infinity,
            fit: BoxFit.cover,
            imageUrl:
                imageUrl ??
                "https://imgs.search.brave.com/1WzxKQxvmdqgJhAFyUUwmf_SSrWrcsUhcgMPRtmclps/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvMTE4/MzMzODQ5OC92ZWN0/b3IvMDU0Ny5qcGc_/cz02MTJ4NjEyJnc9/MCZrPTIwJmM9RWNz/YndCVmVjYWRQYXVL/aGdZZHB0NTYxblla/b3RDZEMzTHlya210/cmdwbz0",
          ),
        ),
        const HeightSpace(16),
        Text(title, style: AppTextStyles.black18),
        const HeightSpace(12),
        Text("$authorName . $publishedAt", style: AppTextStyles.gray12),
      ],
    );
  }
}
