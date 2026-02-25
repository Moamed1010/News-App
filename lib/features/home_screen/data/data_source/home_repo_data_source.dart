
import 'package:news_app/features/home_screen/data/models/new_model.dart';

import '../../../../core/networking/api_endpoints.dart';
import '../../../../core/networking/dio_helper.dart';
import '../../../../core/constants/constants.dart';


abstract class HomeRemoteDataSource {
  Future<NewsModel> getTopHeadlines();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  @override
  Future<NewsModel> getTopHeadlines() async {
    final response = await DioHelper.getRequest(
      endpoint: ApiEndpoints.topHeadlines,
      query: {
        "country": "us", 
        "apiKey": Constants.newApiKey
      },
    );
    

    return NewsModel.fromJson(response.data);
  }
}