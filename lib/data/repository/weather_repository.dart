import 'dart:convert';

import 'package:weather_appp/data/data_provider.dart';
import 'package:weather_appp/data/model/weather_model.dart';

class WeatherRepository {
  DataProvider dataProvider;
  WeatherRepository(this.dataProvider);

  Future<WeatherModel> getCurrentWeather() async{
    try{
    //  String cityName='Butwal';
      final weatherData = await dataProvider.getCurrentWeather();
      final data= jsonDecode(weatherData);
        print(data);
      // if(data['cod']!=200){
      //   throw('API calling error');
      // }
      
      // WeatherModel.fromMap(data);
    }
    catch(e){
      print(e.toString());
    }
    throw Exception(Error);
  }
}