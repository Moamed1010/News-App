import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/styles/app_text_styles.dart';
import 'package:news_app/core/widgets/spacing_widget.dart';

class CustomArticaleCard extends StatelessWidget {
  final String? imageUrl;
  final String title;
  final String publishedAt;
  final String authorName;
  const CustomArticaleCard({
    super.key,
    this.imageUrl,
    required this.title,
    required this.publishedAt,
    required this.authorName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 24.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 238.w ,
                child: Text(title, style: AppTextStyles.black18),
              ),
              const SizedBox(height: 8),
              Text("$authorName . $publishedAt", style: AppTextStyles.gray12),
            ],
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: CachedNetworkImage(
              fit: BoxFit.fitHeight,
              height: 80.h,
              width: 112.w,
              imageUrl:
                  imageUrl ??
                  "https://imgs.search.brave.com/1WzxKQxvmdqgJhAFyUUwmf_SSrWrcsUhcgMPRtmclps/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvMTE4/MzMzODQ5OC92ZWN0/b3IvMDU0Ny5qcGc_/cz02MTJ4NjEyJnc9/MCZrPTIwJmM9RWNz/YndCVmVjYWRQYXVL/aGdZZHB0NTYxblla/b3RDZEMzTHlya210/cmdwbz0",
            ),
          ),
        ],
      ),
    );
  }
}
