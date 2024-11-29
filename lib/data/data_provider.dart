import 'package:http/http.dart' as http;
import 'package:weather_appp/secret.dart';
class DataProvider {
  Future<String> getCurrentWeather() async{
    try{
  final response = await http.get(Uri.parse( 'https://api.open-meteo.com/v1/forecast?latitude=28&longitude=84&hourly=temperature_2m'));
  return response.body; 
    }
    catch(e){
      print(e.toString());
    }
    throw Exception('error occured');
  }
}