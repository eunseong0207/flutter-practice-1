import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_practice_1/main.dart';
import 'package:flutter_practice_1/post.dart';
import 'package:http/http.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post> postList = [];

  @override
  // HomePage 위젯이 화면에 보이고 난 후 단 한번만 실행되는 함수 initState
  void initState() {
    super.initState();
    loadDate();
  }

  void loadDate() async {
    print("데이터 가져오기 시작");
    // 1. JSON 데이터 불러오기
    //    - HTTP통신 하기위해서 http 패키지 추가
    //    - http 패키지의 Client 라는 객체를 이용해서 편지를 쓸 수 있음
    Client c = Client();
    // 비동기 작억하기위해 awit 와 async 사용이 불가함
    //(별도 함수로 만들어줘야함 void (함수명)()astnc{
    // })
    Response result = await c.get(
      Uri.parse("https://jsonplaceholder.typicode.com/posts"),
      // 브라우저에서 주소 입력하고 엔터치는거랑 똑같은 요청
    );
    print(result.statusCode); // 답장의 상태 : 200 -> 성공 , 404 -> 답장을 쓸 수 없음
    String data = result.body; // result.body 에 답장의 내용이 문자열 형태로 담겨있다.

    // 2. 문자열을 객체로 변환 (역직렬화)
    final List<dynamic> decodedData = jsonDecode(data);
    print(decodedData.runtimeType);

    for (var d in decodedData) {
      ;
      print(d.runtimeType);
      Post newPost = Post(
        userId: d["userId"],
        id: d["id"],
        title: d['title'],
        body: d['body'],
      );
      postList.add(newPost);
    }
    print("데이터 가져오기 끝");
    // 3. 화면에 뿌려주기
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    print("위젯 그리기 시작");

    return Scaffold(
      appBar: AppBar(title: Text("블로그 샘플")),
      // ListView.builder :itemCount 속성에 정의한 갯수만큼
      // itemBuilder 속성에서 반환하는 위젯 보여주는 네임드 생성자.
      body: ListView.builder(
        padding: EdgeInsets.all(20),
        itemCount: postList.length,
        itemBuilder: (context, index) {
          print(index);
          Post p = postList[index];
          Widget item = Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(),
            ),
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("포스트 아이디 : ${p.id}"),
                Text("사용자 아이디 : ${p.userId}"),
                Text("제목 : ${p.title}"),
                Text("내용 : ${p.body}"),
              ],
            ),
          );
          return item;
        },
        //
      ),
    );
  }
}
