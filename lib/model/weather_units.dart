/// 기상 데이터의 측정 단위를 정의하는 클래스
class WeatherUnits {
  final String time;
  final String temperature;
  final String windspeed;
  final String weathercode;
  WeatherUnits({
    required this.time,
    required this.temperature,
    required this.windspeed,
    required this.weathercode,
  });
  factory WeatherUnits.fromJson(Map<String, dynamic> json) {
    return WeatherUnits(
      time: json['time'],
      temperature: json['temperature'],
      windspeed: json['windspeed'],
      weathercode: json['weathercode'],
    );
  }
}
