import 'dart:convert';

/// ### 날씨 API 응답 전체 데이터를 담는 최상위 클래스
///
/// 위경도, 시간대 정보 및 현재 날씨와 그 단위 정보를 포함합니다.
class Weather {
  /// ### 요청한 위치의 위도 (Latitude)
  final double latitude;

  /// ### 요청한 위치의 경도 (Longitude)
  final double longitude;

  /// ### 서버가 이 날씨 데이터를 생성하는 데 걸린 시간 (밀리초 단위)
  final double generationTimeMs;

  /// ### UTC 기준 시차 (초 단위)
  /// 예: 0 (GMT), 32400 (KST, UTC+9)
  final int utcOffsetSeconds;

  /// ### 설정된 시간대 이름
  /// 예: "GMT", "Asia/Seoul"
  final String timezone;

  /// ### 시간대 약어
  /// 예: "GMT", "KST"
  final String timezoneAbbreviation;

  /// ### 해당 위치의 해발 고도 (미터 단위)
  final double elevation;

  /// ### 현재 날씨 데이터(`currentWeather`)의 각 필드별 단위 정보 객체
  final WeatherUnits currentWeatherUnits;

  /// ### 현재 시점의 실제 날씨 데이터 객체
  final CurrentWeather currentWeather;

  /// 기본 생성자
  Weather({
    required this.latitude,
    required this.longitude,
    required this.generationTimeMs,
    required this.utcOffsetSeconds,
    required this.timezone,
    required this.timezoneAbbreviation,
    required this.elevation,
    required this.currentWeatherUnits,
    required this.currentWeather,
  });

  /// JSON 맵에서 Weather 객체를 생성하는 팩토리 생성자
  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      // JSON 키 이름이 snake_case이므로 camelCase로 매핑
      generationTimeMs: (json['generationtime_ms'] as num).toDouble(),
      utcOffsetSeconds: json['utc_offset_seconds'] as int,
      timezone: json['timezone'] as String,
      timezoneAbbreviation: json['timezone_abbreviation'] as String,
      elevation: (json['elevation'] as num).toDouble(),
      // 중첩된 객체는 해당 클래스의 fromJson 호출
      currentWeatherUnits: WeatherUnits.fromJson(json['current_weather_units']),
      currentWeather: CurrentWeather.fromJson(json['current_weather']),
    );
  }
}

/// ### 현재 날씨 데이터의 단위(Unit) 정보를 담는 클래스
///
/// `CurrentWeather` 클래스의 각 필드가 어떤 단위를 사용하는지 설명합니다.
class WeatherUnits {
  /// ### 시간 표시 형식 단위
  /// 예: "iso8601"
  final String time;

  /// ### 데이터 간격의 단위
  /// 예: "seconds"
  final String interval;

  /// ### 기온의 단위
  /// 예: "°C" (섭씨), "°F" (화씨)
  final String temperature;

  /// ### 풍속의 단위
  /// 예: "km/h", "m/s"
  final String windSpeed;

  /// ### 풍향의 단위
  /// 예: "°" (도)
  final String windDirection;

  /// ### 낮/밤 구분값의 형식 정보
  final String isDay;

  /// ### 기상 코드의 형식 단위
  /// 예: "wmo code"
  final String weatherCode;

  WeatherUnits({
    required this.time,
    required this.interval,
    required this.temperature,
    required this.windSpeed,
    required this.windDirection,
    required this.isDay,
    required this.weatherCode,
  });

  factory WeatherUnits.fromJson(Map<String, dynamic> json) {
    return WeatherUnits(
      time: json['time'] as String,
      interval: json['interval'] as String,
      temperature: json['temperature'] as String,
      windSpeed: json['windspeed'] as String,
      windDirection: json['winddirection'] as String,
      isDay: json['is_day'] as String,
      weatherCode: json['weathercode'] as String,
    );
  }
}

/// ### 현재 시점의 날씨 실측 데이터를 담는 클래스
class CurrentWeather {
  /// ### 날씨 데이터 관측 시간
  /// ISO 8601 형식의 문자열 (예: "2025-12-30T00:00")
  final String time;

  /// ### 데이터 갱신 간격 (초 단위)
  final int interval;

  /// ### 현재 기온
  /// 단위는 `WeatherUnits.temperature` 참조
  final double temperature;

  /// ### 현재 풍속
  /// 단위는 `WeatherUnits.windSpeed` 참조
  final double windSpeed;

  /// ### 현재 풍향 (0°~360°)
  /// 0은 북쪽, 90은 동쪽, 180은 남쪽, 270은 서쪽을 의미합니다.
  final int windDirection;

  /// ### 낮/밤 여부
  /// 1 = 낮(Day), 0 = 밤(Night)
  final int isDay;

  /// ### WMO(세계기상기구) 날씨 상태 코드
  /// 날씨 상태를 숫자로 표현한 코드 (예: 0=맑음, 1~3=구름, 등등)
  final int weatherCode;

  CurrentWeather({
    required this.time,
    required this.interval,
    required this.temperature,
    required this.windSpeed,
    required this.windDirection,
    required this.isDay,
    required this.weatherCode,
  });

  factory CurrentWeather.fromJson(Map<String, dynamic> json) {
    return CurrentWeather(
      time: json['time'] as String,
      interval: json['interval'] as int,
      // 숫자가 int로 오든 double로 오든 안전하게 double로 변환
      temperature: (json['temperature'] as num).toDouble(),
      windSpeed: (json['windspeed'] as num).toDouble(),
      windDirection: json['winddirection'] as int,
      isDay: json['is_day'] as int,
      weatherCode: json['weathercode'] as int,
    );
  }
}

// ==========================================
// 사용 예시 (Usage Example)
// ==========================================
void main() {
  // 제공해주신 JSON 데이터 문자열
  String jsonString = """
  {
    "latitude": 37.55,
    "longitude": 127,
    "generationtime_ms": 0.0861883163452148,
    "utc_offset_seconds": 0,
    "timezone": "GMT",
    "timezone_abbreviation": "GMT",
    "elevation": 37,
    "current_weather_units": {
      "time": "iso8601",
      "interval": "seconds",
      "temperature": "°C",
      "windspeed": "km/h",
      "winddirection": "°",
      "is_day": "",
      "weathercode": "wmo code"
    },
    "current_weather": {
      "time": "2025-12-30T00:00",
      "interval": 900,
      "temperature": -4.2,
      "windspeed": 3.8,
      "winddirection": 319,
      "is_day": 1,
      "weathercode": 0
    }
  }
  """;

  // 1. JSON 문자열을 Map으로 디코딩
  Map<String, dynamic> userMap = jsonDecode(jsonString);

  // 2. fromJson 생성자를 통해 Weather 객체 생성
  Weather weatherData = Weather.fromJson(userMap);

  // 3. 데이터 사용 확인 (IDE에서 weatherData의 필드에 마우스를 올려보세요)
  print('위치: 위도 \${weatherData.latitude}, 경도 \${weatherData.longitude}');
  print('시간대: \${weatherData.timezone} (\${weatherData.timezoneAbbreviation})');

  // 현재 날씨 및 단위 정보 활용
  final current = weatherData.currentWeather;
  final units = weatherData.currentWeatherUnits;

  print('--- 현재 날씨 ---');
  print('시간: \${current.time}');
  print('기온: \${current.temperature}\${units.temperature}');
  print('풍속: \${current.windSpeed} \${units.windSpeed}');
  print('풍향: \${current.windDirection}\${units.windDirection}');
  print('상태: \${current.isDay == 1 ? "낮" : "밤"} (코드: \${current.weatherCode})');
}
