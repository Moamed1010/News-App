import 'package:news_app/features/home_screen/domain/entity/article_entity.dart';

class NewsEntity {
  String? status;
  int? totalResults;
  List<ArticleEntity>? articles;

  NewsEntity({this.status, this.totalResults, this.articles});
}
