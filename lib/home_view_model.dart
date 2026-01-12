//
import 'dart:convert';

import 'package:flutter_practice_1/model/weather.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

// 1. 홈페이지에 보여지는 상태 변수들을 담는 클래스
class HomeState {
  Weather? weather;
  HomeState({required this.weather});
}

// 2. 상태를 관리하는 클래스 => 1번 클래스 객체를 실제로 담고 있는 클래스
// 이거는 riverpod 패키지의 사용 방법
// Notifier < 관리해야하는 상태의 클래스명 >
class HomeViewModel extends Notifier<HomeState> {
  @override
  HomeState build() {
    return HomeState(weather: null);
  }

  void loadWeather() async {
    // 1. 데이터 달라고 편지쓰기 > http 통신 GET 요청
    Client httpClient = Client(); // http 통신을 하기위한 객체
    Uri taget = Uri.parse(
      "https://api.open-meteo.com/v1/forecast?latitude=37.57&longitude=126.98&current_weather=true",
    );
    Response r = await httpClient.get(taget);
    // 2. 정보가 담긴 답장 받기
    print(r.statusCode);
    //편지가 정상적으로 전달되고 답장을 받았는지 알려주는 숫자코드
    print(r.body);
    // 성공 : 200 , 실패 : 404,

    // 3. 답장내용(JSON) > Map 으로 변경
    Map<String, dynamic> jsonMap = jsonDecode(r.body);
    // 4. Map 객체로 변경 (3 ~ 4 : 역직렬화)
    Weather w = Weather.fromJson(jsonMap);
    state = HomeState(weather: w);
    //
  }

  //
}
// 객체를 한번만 생성하기 위해서 사용
// 싱글톤 패턴 -> 객체를 한번만 생성 -> 쉽게 할 수 있게 도와주는게 NotifierPrivider
// 로직과 상태가 분리가 완료됨
// 이제부턴 사용에 관한 내용임
// 의존성 주입
// 객체를 HomePage 에서 직접 생성하면 여전히 자녀위젯에 생성자를 통해 전달 해줘야흐는 불편함이 있음
// 객체를 직접 생성하지 않고 공급해주는 NotivierProvider 사용 => 의존성 주입
//
// NotivierProvider는 공급해줄 객체 (ViewModerl)의 타입과 상태클래스 타입을 제너릭으로 명시해줘야함

final HomeViewModelProvider = NotifierProvider<HomeViewModel, HomeState>(
  //
  () {
    print("homeviewmodel 생성됨");
    return HomeViewModel();
    //
  },
);
