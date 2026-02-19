import 'package:news_app/core/models/news_model.dart';
import '../../../core/constants/constants.dart';
import '../../../core/networking/api_endpoints.dart';
import '../../../core/networking/dio_helper.dart';

class SearchResultRepo {

  Future<NewsModel> searchItemByName(String query) async {
    try {
      final response = await DioHelper.getRequest(
        endpoint: ApiEndpoints.everything,

        query: {
          "q": query,
          "apiKey": Constants.newApiKey,
          "language": Constants.language
        },
      );

        return NewsModel.fromJson(response.data);
      
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}