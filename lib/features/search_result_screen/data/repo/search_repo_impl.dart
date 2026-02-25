
import 'package:dartz/dartz.dart';
import 'package:news_app/features/home_screen/domain/entity/news_entity.dart';
import 'package:news_app/features/search_result_screen/data/data_source/search_remote_data_sourc.dart';
import '../../../../core/failure.dart';
import '../../domain/reop/search_repo.dart';

class SearchRepoImpl implements SearchRepo {
  final SearchRemoteDataSource remoteDataSource;

  SearchRepoImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, NewsEntity>> searchArticles(String query) async {
    try {
      final result = await remoteDataSource.searchArticles(query);
      return Right(result);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
