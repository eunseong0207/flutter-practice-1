import 'package:freezed_annotation/freezed_annotation.dart';
import 'current_weather_units.dart';
import 'current_weather.dart';

part 'weather.freezed.dart';
part 'weather.g.dart';

@freezed
abstract class Weather with _$Weather {
  const factory Weather({
    required double latitude,
    required double longitude,
    @JsonKey(name: 'generationtime_ms') required double generationTimeMs,
    @JsonKey(name: 'utc_offset_seconds') required int utcOffsetSeconds, // 추가
    required String timezone,
    @JsonKey(name: 'timezone_abbreviation')
    required String timezoneAbbreviation, // 추가
    required double elevation,
    @JsonKey(name: 'current_weather_units')
    required CurrentWeatherUnits currentWeatherUnits, // 추가
    @JsonKey(name: 'current_weather')
    required CurrentWeather currentWeather, // 추가
  }) = _Weather;

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
}
