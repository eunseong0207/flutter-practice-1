import 'package:flutter_practice_1/model/current_weather.dart';
import 'package:flutter_practice_1/model/weather_units.dart';

/// 전체 기상 응답 데이터를 담는 클래스
class Weather {
  /// 위도 (Latitude)
  final double latitude;

  /// 경도 (Longitude)
  final double longitude;

  /// 생성 시간 (ms)
  final double generationTimeMs;

  /// 해발 고도
  final double elevation;

  /// 현재 기상 단위 정보
  final WeatherUnits currentWeatherUnits;

  /// 현재 기상 상세 정보
  final CurrentWeather currentWeather;
  Weather({
    required this.latitude,
    required this.longitude,
    required this.generationTimeMs,
    required this.elevation,
    required this.currentWeatherUnits,
    required this.currentWeather,
  });

  /// JSON 데이터를 기반으로 Weather 인스턴스를 생성하는 네임드 생성자
  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      generationTimeMs: (json['generationtime_ms'] as num).toDouble(),
      elevation: (json['elevation'] as num).toDouble(),
      currentWeatherUnits: WeatherUnits.fromJson(json['current_weather_units']),
      currentWeather: CurrentWeather.fromJson(json['current_weather']),
    );
  }
}
