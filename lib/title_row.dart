import 'package:flutter/material.dart';

class TitleRow extends StatelessWidget {
  const TitleRow({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Text 위젯의 크기가 없을경우
        // 글자 길이만큼 크기를 차지
        // 글자가 길어져서 화면크기 이상으로 길어진다면
        // overflow 속성을 활용할 수 없음
        Expanded(
          child: Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              // wordSpacing: -1, 띄어쓰기 간격 줄여줌
              letterSpacing: -1.5, // 글자 사이 간격 줄여줌
              height: 1,
              // 글자 높이 설정
              // (fontSize * height = 글자 높이)
            ),
          ),
        ),
        Text(
          "See all >",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        //
      ],
    );
  }
}
