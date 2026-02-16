import 'package:news_app/core/models/news_model.dart';

import '../../../core/constants/constants.dart';
import '../../../core/networking/api_endpoints.dart';
import '../../../core/networking/dio_helper.dart';

class SearchResultServices {
   searchItemByName(String query) async {
    try {
      final response = await DioHelper.getRequest(
        endpoint: ApiEndpoints.everything,
        query: {"q": query, "apiKey": Constants.newApiKey,"language": Constants.language},
      );
      if (response.statusCode == 200) {
        NewsModel result = NewsModel.fromJson(
          response.data,
        );
        return result;
      }
    } on Exception catch (e) {
      return Future.error(e.toString());
    }
  }
}