
import 'package:dartz/dartz.dart';
import 'package:news_app/core/failure.dart'; 
import 'package:news_app/features/home_screen/domain/entity/news_entity.dart';
import 'package:news_app/features/home_screen/domain/reop/get_article_repo.dart';

class GetNewsUseCase {
  final NewsRepository repository;

  GetNewsUseCase(this.repository);

  Future<Either<Failure, NewsEntity>> call() async {
    return await repository.getNews();
  }
}
