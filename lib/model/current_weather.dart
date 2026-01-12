/// 현재 구체적인 기상 수치를 담는 클래스
class CurrentWeather {
  /// 관측 시간 (ISO8601 형식)
  final String time;

  /// 현재 기온
  final double temperature;

  /// 현재 풍속
  final double windspeed;

  /// 풍향 (도 단위, 0-360)
  final int windDirection;

  /// 낮/밤 여부 (1: 낮, 0: 밤)
  final int isDay;

  /// WMO 기상 코드
  final int weatherCode;

  CurrentWeather({
    required this.time,
    required this.temperature,
    required this.windspeed,
    required this.windDirection,
    required this.isDay,
    required this.weatherCode,
  });

  factory CurrentWeather.fromJson(Map<String, dynamic> json) {
    return CurrentWeather(
      time: json['time'],
      temperature: (json['temperature'] as num).toDouble(),
      windspeed: (json['windspeed'] as num).toDouble(),
      windDirection: json['winddirection'] as int,
      isDay: json['is_day'] as int,
      weatherCode: json['weathercode'] as int,
    );
  }
}
