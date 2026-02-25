import 'package:news_app/features/home_screen/data/models/source_model.dart';
import 'package:news_app/features/home_screen/domain/entity/article_entity.dart';


class ArticleModel extends ArticleEntity {
  ArticleModel({
    super.source,
    super.author, 
    super.title,
    super.description,
    super.url,
    super.urlToImage,
    super.publishedAt,
    super.content,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      title: json['title'],
      author: json['author'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      content: json['content'],
      publishedAt: json['publishedAt'] != null
          ? DateTime.parse(json['publishedAt'])
          : null,
      source: json['source'] != null
          ? SourceModel.fromJson(json['source'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
  
      'source': source != null ? (source as SourceModel).toJson() : null,
      'author': author,
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
      'publishedAt': publishedAt?.toIso8601String(),
      'content': content,
    };
  }
}
