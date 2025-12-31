import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_practice_1/main.dart';
import 'package:flutter_practice_1/weather.dart';
import 'package:http/http.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //
  String displayTemp = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('오늘의 날씨'),
        //
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              displayTemp,
              style: TextStyle(fontSize: 36),
              //
            ),
            IconButton(
              onPressed: () async {
                // 1. 데이터 달라고 편지쓰기 > http 통신 GET 요청
                Client httpClient = Client(); // http 통신을 하기위한 객체
                Uri taget = Uri.parse(
                  "https://api.open-meteo.com/v1/forecast?latitude=37.57&longitude=126.98&current_weather=true",
                );
                Response r = await httpClient.get(taget);
                // 2. 정보가 담긴 답장 받기
                print(r.statusCode);
                print(r.body);
                //편지가 정상적으로 전달되고 답장을 받았는지 알려주는 숫자코드
                // 성공 : 200 , 실패 : 404,

                // 3. 답장내용(JSON) > Map 으로 변경
                Map<String, dynamic> jsonMap = jsonDecode(r.body);
                // 4. Map 객체로 변경 (3 ~ 4 : 역직렬화)
                Weather w = Weather.fromJson(jsonMap);
                displayTemp =
                    "${w.currentWeather.temperature} ${w.currentWeatherUnits.temperature}";
                setState(() {});
              },
              icon: Icon(Icons.refresh),
              //
            ),
          ],
        ),
      ),
    );
  }
}
