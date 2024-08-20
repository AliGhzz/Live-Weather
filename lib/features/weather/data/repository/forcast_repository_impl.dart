import 'package:dio/dio.dart';
import 'package:live_weather/core/network/data_state.dart';
import 'package:live_weather/features/weather/data/data_source/remote/api_provider.dart';
import 'package:live_weather/features/weather/data/model/forcast_model.dart';

class ForcastRepository {
  ApiProvider apiProvider;
  ForcastRepository(this.apiProvider);
  Future<DataState<Forcast>> fetchForcasts({required String city})async{
    try{
      Response response = await apiProvider.getForcast(city: city);
      if(response.statusCode==200){
        Forcast forcast =Forcast.convertJsonToForcast(response.data);
        return DataSuccess(forcast);
      }else{
        return DataFailed("Something Went Wrong. try again ...");
      }
    }catch(e){
      return DataFailed("Please Check your connection");
    }
  }
}