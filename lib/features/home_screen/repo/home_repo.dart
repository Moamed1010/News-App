import 'package:news_app/core/networking/api_endpoints.dart';
import 'package:news_app/core/networking/dio_helper.dart';

import '../../../core/constants/constants.dart';
import '../../../core/models/news_model.dart';

class HomeRepo {
  getTopHeadlinesArticles() async {
    try {
      final response = await DioHelper.getRequest(
        endpoint: ApiEndpoints.topHeadlines,
        query: {"country": "us", "apiKey": Constants.newApiKey},
      );
      if (response.statusCode == 200) {
        NewsModel topHeadlinesModel = NewsModel.fromJson(response.data);
        return topHeadlinesModel;
      }
    } on Exception catch (e) {
      return Future.error(e.toString());
    }
  }
}
