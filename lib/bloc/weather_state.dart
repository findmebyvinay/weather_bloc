import 'package:equatable/equatable.dart';
import 'package:weather_appp/data/model/weather_model.dart';
enum Status{loading,success,error}
// ignore: must_be_immutable
class WeatherState extends Equatable{
  WeatherModel ?weatherModel;
  Status status;
  WeatherState({
    this.weatherModel,this.status=Status.loading
  });

  WeatherState copyWith({WeatherModel ? weatherModel,Status? status}){
    return WeatherState(weatherModel:weatherModel ?? this.weatherModel,
    status: status ?? this.status);
  }

  List<Object> get props=>[weatherModel!,status];

}