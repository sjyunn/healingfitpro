import 'package:flutter/material.dart';
import 'package:hfitpro/widgets/manual_widget.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ManualPage extends StatefulWidget {
  const ManualPage({super.key});

  @override
  State<ManualPage> createState() => _ManualPageState();
}

// 사용방법 전체 영문 아이디 : DJfSROddJxw
// 사용방법 전체 영문 아이디 : 6blQHZPt6Dw
// 사용방법 전체 영문 아이디 : 1eQIem3rL_g
class _ManualPageState extends State<ManualPage> {
  static String youtubeId1 = 'DJfSROddJxw';
  static String youtubeId2 = '6blQHZPt6Dw';
  static String youtubeId3 = '1eQIem3rL_g';
  final YoutubePlayerController _con1 = YoutubePlayerController(
    initialVideoId: youtubeId1,
    flags: const YoutubePlayerFlags(autoPlay: false),
  );
  final YoutubePlayerController _con2 = YoutubePlayerController(
    initialVideoId: youtubeId2,
    flags: const YoutubePlayerFlags(autoPlay: false),
  );
  final YoutubePlayerController _con3 = YoutubePlayerController(
    initialVideoId: youtubeId3,
    flags: const YoutubePlayerFlags(autoPlay: false),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: const Text(
          '매뉴얼 페이지',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Manual(
                con: _con1,
                clipTitle: '사용법 전체 영상',
                clipComment: 'TES 기능은 하루 30분 정도 꾸준히 하시면\n도움이 됩니다.',
              ),
            ),
            const SizedBox(
              width: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Manual(
                con: _con2,
                clipTitle: '전원 끄고 켜기',
                clipComment: 'TES 기능은 하루 30분 정도 꾸준히 하시면\n도움이 됩니다.',
              ),
            ),
            const SizedBox(
              width: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Manual(
                con: _con3,
                clipTitle: '테라피 동작 시작/종료',
                clipComment: 'TES 기능은 하루 30분 정도 꾸준히 하시면\n도움이 됩니다.',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
