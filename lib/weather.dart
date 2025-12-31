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
