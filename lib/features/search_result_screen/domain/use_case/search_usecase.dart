
import 'package:dartz/dartz.dart';
import 'package:news_app/core/failure.dart';
import 'package:news_app/features/home_screen/domain/entity/news_entity.dart';
import 'package:news_app/features/search_result_screen/domain/reop/search_repo.dart';

class SearchArticlesUseCase {
  final SearchRepo repository;
  SearchArticlesUseCase(this.repository);

  Future<Either<Failure, NewsEntity>> call(String query) async {
    return await repository.searchArticles(query);
  }
}