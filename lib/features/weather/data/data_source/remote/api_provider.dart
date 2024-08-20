import 'package:dio/dio.dart';
import 'package:live_weather/core/utils/constants.dart';
import 'package:logger/logger.dart';

class ApiProvider {
  final Dio dio = Dio();
  var logger = Logger();
  final baseUrl = Constants.baseUrl;
  final apiKey = Constants.apiKey;

  Future<dynamic> getCurrentWeather({required String city}) async {
    dio.options.connectTimeout = Duration(milliseconds: 3000);
    try {
      var response = await dio.get("$baseUrl/data/2.5/weather",
          queryParameters: {'q': city, 'appid': apiKey, 'units': 'metric'});
      return response;
    } on DioException catch (e) {
      logger.e(e.message);
    }
  }

  Future<dynamic> getForcast({required String city}) async {
    dio.options.connectTimeout = Duration(milliseconds: 3000);
    try {
      var response = await dio.get('$baseUrl/data/2.5/forecast',
          queryParameters: {'q': city, 'appid': apiKey, 'units': 'metric'});
    
      return response;
    } on DioException catch (e) {
      logger.e(e.message);
    }
  }

  /// city name suggest api
  Future<dynamic> sendRequestCitySuggestion(String prefix) async {
    var response = await Dio().get(
        "http://geodb-free-service.wirefreethought.com/v1/geo/cities",
        queryParameters: {'limit': 7, 'offset': 0, 'namePrefix': prefix});

    return response;
  }
}
