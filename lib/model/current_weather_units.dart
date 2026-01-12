import 'package:freezed_annotation/freezed_annotation.dart';

part 'current_weather_units.freezed.dart';
part 'current_weather_units.g.dart';

@freezed
abstract class CurrentWeatherUnits with _$CurrentWeatherUnits {
  const factory CurrentWeatherUnits({
    required String time,
    required String interval,
    required String temperature,
    required String windspeed,
    required String winddirection,
    @JsonKey(name: 'is_day') required String isDay,
    required String weathercode,
  }) = _CurrentWeatherUnits;

  factory CurrentWeatherUnits.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherUnitsFromJson(json);
}
