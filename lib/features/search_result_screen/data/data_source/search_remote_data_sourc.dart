
import 'package:news_app/features/home_screen/data/models/new_model.dart';

import '../../../../core/networking/api_endpoints.dart';
import '../../../../core/networking/dio_helper.dart';
import '../../../../core/constants/constants.dart';


abstract class SearchRemoteDataSource {
  Future<NewsModel> searchArticles(String query);
}

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  @override
  Future<NewsModel> searchArticles(String query) async {
    final response = await DioHelper.getRequest(
      endpoint: ApiEndpoints.everything,
      query: {
        "q": query,
        "apiKey": Constants.newApiKey,
        "language": Constants.language
      },
    );
  
    return NewsModel.fromJson(response.data);
  }
}