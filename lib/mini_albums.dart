import 'package:flutter/material.dart';
import 'package:flutter_practice_1/rounded_image.dart';

class MiniAlbums extends StatelessWidget {
  const MiniAlbums({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.artist,
  });

  final String imageUrl;
  final String title;
  final String artist;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //
        SizedBox.square(
          // dimension :가로,세로 동일한 크기값을 줄 때
          dimension: 60,
          child: RoundedImage(imageUrl: imageUrl),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //
              Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                artist,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  height: 1,
                ),
              ),
            ],
          ),
        ),
        Icon(Icons.more_horiz),
      ],
    );
  }
}
