import 'package:equatable/equatable.dart';

abstract class WeatherEvent extends Equatable{
  List<Object> get porps=>[];
}

class WeatherFetched extends WeatherEvent{
  
  List<Object> get props=>[];
}