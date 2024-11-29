import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:weather_appp/bloc/weather_event.dart';
import 'package:weather_appp/bloc/weather_state.dart';
import 'package:weather_appp/data/repository/weather_repository.dart';

class WeatherBloc extends Bloc<WeatherEvent,WeatherState>{
  WeatherRepository weatherRepository;
  WeatherBloc(this.weatherRepository):super(WeatherState()){
   on<WeatherFetched> (_getWeather);

  }

  Future<void> _getWeather(WeatherFetched event, Emitter<WeatherState> emit) async{
     await weatherRepository.getCurrentWeather().
     then((value){
      emit(state.copyWith(
        status: Status.success,
        weatherModel: value
      ));
     }).onError((error, stackTrace) {
       emit(state.copyWith(status:Status.error,
    ));
     },);  
    
  }
}