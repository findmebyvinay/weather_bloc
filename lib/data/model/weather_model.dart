// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class WeatherModel {
  int? latitude;
  double? longitude;
  double? generationtimeMs;
  int? utcOffsetSeconds;
  String? timezone;
  String? timezoneAbbreviation;
  int? elevation;
  HourlyUnits? hourlyUnits;
  Hourly? hourly;

  WeatherModel(
      {this.latitude,
      this.longitude,
      this.generationtimeMs,
      this.utcOffsetSeconds,
      this.timezone,
      this.timezoneAbbreviation,
      this.elevation,
      this.hourlyUnits,
      this.hourly});

  WeatherModel.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
    generationtimeMs = json['generationtime_ms'];
    utcOffsetSeconds = json['utc_offset_seconds'];
    timezone = json['timezone'];
    timezoneAbbreviation = json['timezone_abbreviation'];
    elevation = json['elevation'];
    hourlyUnits = json['hourly_units'] != null
        ? new HourlyUnits.fromJson(json['hourly_units'])
        : null;
    hourly =
        json['hourly'] != null ? new Hourly.fromJson(json['hourly']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['generationtime_ms'] = this.generationtimeMs;
    data['utc_offset_seconds'] = this.utcOffsetSeconds;
    data['timezone'] = this.timezone;
    data['timezone_abbreviation'] = this.timezoneAbbreviation;
    data['elevation'] = this.elevation;
    if (this.hourlyUnits != null) {
      data['hourly_units'] = this.hourlyUnits!.toJson();
    }
    if (this.hourly != null) {
      data['hourly'] = this.hourly!.toJson();
    }
    return data;
  }
}

class HourlyUnits {
  String? time;
  String? temperature2m;

  HourlyUnits({this.time, this.temperature2m});

  HourlyUnits.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    temperature2m = json['temperature_2m'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['temperature_2m'] = this.temperature2m;
    return data;
  }
}

class Hourly {
  List<String>? time;
  List<double>? temperature2m;

  Hourly({this.time, this.temperature2m});

  Hourly.fromJson(Map<String, dynamic> json) {
    time = json['time'].cast<String>();
    temperature2m = json['temperature_2m'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['temperature_2m'] = this.temperature2m;
    return data;
  }
}

// class WeatherModel {
//   final double currentTemp;
//   final String currentSky;
//   final double currentPressure;
//   final double currentWindSpeed;
//   final double currentHumidity;
//   WeatherModel({
//     required this.currentTemp,
//     required this.currentSky,
//     required this.currentPressure,
//     required this.currentWindSpeed,
//     required this.currentHumidity,
//   });

//   WeatherModel copyWith({
//     double? currentTemp,
//     String? currentSky,
//     double? currentPressure,
//     double? currentWindSpeed,
//     double? currentHumidity,
//   }) {
//     return WeatherModel(
//       currentTemp: currentTemp ?? this.currentTemp,
//       currentSky: currentSky ?? this.currentSky,
//       currentPressure: currentPressure ?? this.currentPressure,
//       currentWindSpeed: currentWindSpeed ?? this.currentWindSpeed,
//       currentHumidity: currentHumidity ?? this.currentHumidity,
//     );
//   }

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'currentTemp': currentTemp,
//       'currentSky': currentSky,
//       'currentPressure': currentPressure,
//       'currentWindSpeed': currentWindSpeed,
//       'currentHumidity': currentHumidity,
//     };
//   }

//   factory WeatherModel.fromMap(Map<String, dynamic> map) {
//     final currentWeatherData = map['list'][0];

//     return WeatherModel(
//       currentTemp: currentWeatherData['main']['temp'],
//       currentSky: currentWeatherData['weather'][0]['main'],
//       currentPressure: currentWeatherData['main']['pressure'],
//       currentWindSpeed: currentWeatherData['wind']['speed'],
//       currentHumidity: currentWeatherData['main']['humidity'],
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory WeatherModel.fromJson(String source) =>
//       WeatherModel.fromMap(json.decode(source) as Map<String, dynamic>);

//   @override
//   String toString() {
//     return 'WeatherModel(currentTemp: $currentTemp, currentSky: $currentSky, currentPressure: $currentPressure, currentWindSpeed: $currentWindSpeed, currentHumidity: $currentHumidity)';
//   }

//   @override
//   bool operator ==(covariant WeatherModel other) {
//     if (identical(this, other)) return true;

//     return other.currentTemp == currentTemp &&
//         other.currentSky == currentSky &&
//         other.currentPressure == currentPressure &&
//         other.currentWindSpeed == currentWindSpeed &&
//         other.currentHumidity == currentHumidity;
//   }

//   @override
//   int get hashCode {
//     return currentTemp.hashCode ^
//         currentSky.hashCode ^
//         currentPressure.hashCode ^
//         currentWindSpeed.hashCode ^
//         currentHumidity.hashCode;
//   }
// }