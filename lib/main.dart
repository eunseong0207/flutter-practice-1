import 'package:flutter/material.dart';
import 'package:flutter_practice_1/big_albums.dart';
import 'package:flutter_practice_1/mini_albums.dart';
import 'package:flutter_practice_1/rounded_image.dart';
import 'package:flutter_practice_1/title_row.dart';

// 1. 일단 Scaffold 안에서 작업
// 2. 완성되면 위젯클래스로 분리
// 3. 위젯클래스를 별도의 파일로 분리
// 4. Scaffold에 위젯 배치
// 5. 변경되어야 하는 부분들 속성으로 정의해서 수정!

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
      appBar: homeAppBar(),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          SizedBox(height: 20),
          // 상단 이미지
          // AspectRatio
          // 가로 / 세로
          AspectRatio(
            aspectRatio: 2.5 / 1,
            child: RoundedImage(imageUrl: "https://picsum.photos/300/200"),
          ),
          // 제목행
          TitleRow(title: "New Albums"),
          Row(
            children: [
              //
              BigAlbums(
                imageUrl: "https://picsum.photos/id/85/200/200",
                title: "오늘",
                artist: "신용재",
              ),
              BigAlbums(
                imageUrl: "https://picsum.photos/id/888/200/200",
                title: "세상에서 가장 큰 벚꽃이 피는 마을",
                artist: "달담",
              ),
              BigAlbums(
                imageUrl: "https://picsum.photos/id/423/200/200",
                title: "뭐라할까",
                artist: "김보경",
              ),
            ],
          ),
          // 제목행
          TitleRow(title: "Song List"),
          MiniAlbums(
            imageUrl: "https://picsum.photos/id/735/200/200",
            title: "그대에게 못다 한 말",
            artist: "경서예지",
          ),
          MiniAlbums(
            imageUrl: "https://picsum.photos/id/352/200/200",
            title: "Your Lights",
            artist: "이수",
          ),
          MiniAlbums(
            imageUrl: "https://picsum.photos/id/685/200/200",
            title: "한잔 두잔 세잔",
            artist: "김강패",
          ),
          //
        ],
      ),
    );
  }

  AppBar homeAppBar() {
    return AppBar(
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
    );
  }
}
