// domain/repository/search_repository.dart
import 'package:dartz/dartz.dart';
import 'package:news_app/core/failure.dart';
import 'package:news_app/features/home_screen/domain/entity/news_entity.dart';

abstract class SearchRepo {
  Future<Either<Failure, NewsEntity>> searchArticles(String query);
}
