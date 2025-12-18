import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

///- ListView
///    - ClipRRext : 자녀위젯 그냥 잘라줌
///    (이미지에 많이 사용함)
///        - Image
///    - Row (제목행 이라고 부르자)(TODO 간격 구현하면서 고민)
///        - Text
///        - Text
///    - Row
///        -Column (큰앨범 이라고 부르자)
///            - ClipRRext
///                    - Image
///                - Text
///                - Text
///        - 큰앨범
///           - 큰앨범
///    - 제목행
///    - Row (작은앨범 이라고 부르자)
///        - ClipRRext
///            - Image
///        - Column
///            - Text
///            - Text
///        - Icon
///    - 작은앨범
///    - 작은앨범
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.black,
            ),
            child: Icon(Icons.search, color: Colors.white),
          ),
          SizedBox(width: 16),
        ],

        // title 속성은 안드로이드에서는 왼쪽 기본
        // 아이폰에서는 가운데 기본
        // centerTitle : false 을 주게되면 왼쪽으로 가지만
        // title에 Column을 배치하면 Column 크기가 앱바 영역전체를 차지하기 때문에 무용지물
        // 이럴땐 CrossAxisAlignment 속성으로 조정
        // Column 과 Row 의 CrossAxisAlignment 기본값은 가운데
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "MUSIC",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            Row(
              children: [
                Container(
                  width: 16,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                SizedBox(width: 3),
                Container(
                  width: 5,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
