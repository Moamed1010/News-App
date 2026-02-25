import 'package:dartz/dartz.dart';
import 'package:news_app/core/failure.dart';
import '../entity/news_entity.dart';

abstract class NewsRepository {
 
  Future<Either<Failure, NewsEntity>> getNews();
}