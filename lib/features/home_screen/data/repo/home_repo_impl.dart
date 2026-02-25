// features/home_screen/data/repository/home_repo_impl.dart
import 'package:dartz/dartz.dart';
import 'package:news_app/core/failure.dart';
import 'package:news_app/features/home_screen/data/data_source/home_repo_data_source.dart';
import 'package:news_app/features/home_screen/domain/reop/get_article_repo.dart';
import 'package:news_app/features/home_screen/domain/entity/news_entity.dart';


class HomeRepoImpl implements NewsRepository {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepoImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, NewsEntity>> getNews() async {
    try {
      final result = await remoteDataSource.getTopHeadlines();
      return Right(result); 
    } catch (e) {
      
      return Left(ServerFailure(e.toString()));
    }
  }
}