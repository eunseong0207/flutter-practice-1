import 'dart:convert';

import 'package:flutter_practice_1/matzip.dart';
import 'package:flutter_test/flutter_test.dart';

final jsonData = """
[
  {
    "상호명": "맛나식당",
    "주소": "서울특별시 강남구 테헤란로 123",
    "평점": "4.5"
  },
  {
    "상호명": "정성스시",
    "주소": "서울특별시 마포구 독막로 45",
    "평점": "4.8"
  },
  {
    "상호명": "불타는갈비",
    "주소": "경기도 수원시 팔달구 정조로 700",
    "평점": "4.2"
  }
]

""";

void main() {
  //

  test('컬렉션 메서드 테스트', () {
    // 1. Map 으로 바꿔줌
    List<dynamic> box = jsonDecode(jsonData);
    // 2. 객체로 바꾸기
    List<Matzip> matzipList = [];
    for (var i = 0; i < box.length; i++) {
      Map<String, dynamic> e = box[i];
      Matzip m = conevertMatzip(e);
      matzipList.add(m);
    }
    print(matzipList.length);

    // 3. Collection 메서드 : map => 반복문을 없이 사용하게 해주는 함수
    List<Matzip> matzipList2 = box.map((e) {
      return Matzip.fromJson(e);
      //
    }).toList();
  });
}

Matzip conevertMatzip(dynamic e) {
  Matzip m = Matzip.fromJson(e);
  return m;
}
