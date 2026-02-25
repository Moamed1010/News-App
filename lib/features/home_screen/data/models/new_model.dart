import 'package:news_app/features/home_screen/data/models/article_model.dart';
import 'package:news_app/features/home_screen/domain/entity/news_entity.dart';


class NewsModel extends NewsEntity {
  NewsModel({super.status, super.totalResults, super.articles});

  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      status: json['status'],
      totalResults: json['totalResults'],
      articles: json['articles'] != null
          ? List<ArticleModel>.from(
              json['articles'].map((x) => ArticleModel.fromJson(x)),
            )
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'totalResults': totalResults,
     
      'articles': articles?.map((x) {
        if (x is ArticleModel) return x.toJson();
        return null; 
      }).toList(),
    };
  }
}