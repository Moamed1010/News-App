import 'package:flutter/material.dart';
import 'package:news_app/core/widgets/spacing_widget.dart';
import 'package:news_app/features/home_screen/domain/entity/news_entity.dart';
import 'package:news_app/features/home_screen/presentation/widgets/custom_articale_card.dart';
import 'package:news_app/features/home_screen/presentation/widgets/top_headline_item.dart';

Widget buildNewsList(NewsEntity newsData) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          if (newsData.articles != null && newsData.articles!.isNotEmpty)
            TopHeadlineItem(article: newsData.articles!.first),
          const HeightSpace(24),
          if (newsData.articles != null)
            ...List.generate(
              newsData.articles!.length - 1,
              (index) =>
                  CustomArticleCard(article: newsData.articles![index + 1]),
            ),
        ],
      ),
    ),
  );
}
