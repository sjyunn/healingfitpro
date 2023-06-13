import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Manual extends StatelessWidget {
  final YoutubePlayerController con;
  final String clipTitle;
  final String clipComment;

  const Manual({
    super.key,
    required this.con,
    required this.clipTitle,
    required this.clipComment,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          clipTitle,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 18,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        YoutubePlayer(
          controller: con,
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.green[50],
          ),
          child: Text(
            clipComment,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
