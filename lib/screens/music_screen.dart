import 'package:flutter/material.dart';

class MusicChange extends StatefulWidget {
  const MusicChange({
    super.key,
  });

  @override
  State<MusicChange> createState() => _MusicChangeState();
}

class _MusicChangeState extends State<MusicChange> {
  final modeName = ['수면 모드', '학습 모드', '힐링 모드'];
  final healingSound = [
    [
      'NIGHT FLYING(수면1)',
      'SMR DREAM(수면2)',
      'SUMMER DREAM(수면3)',
      'SOMEDAY(수면4)',
      'The Sound Of Winter(수면5)'
    ],
    [
      'A RAINY DAY(학습1)',
      'Sweet Wind(학습2)',
      'Sea of Memories(학습3)',
      'Think about you(학습4)',
      'Mirror(학습5)'
    ],
    [
      'OPEN YOUR HEART(힐링1)',
      'SECRET STROY(힐링2)',
      'DAWN ROAD(힐링3)',
      'PINE TREE(힐링4)',
      'AT HOME(힐링5)'
    ],
  ];
  int modeIndex = 0;
  int songIndex = 0;
  String songTitle = 'NIGHT FLYING(수면1)';
  String modeTitle = '수면 모드';

  void previousSongPressed() {
    setState(() {
      if (songIndex > 0) {
        songIndex = songIndex - 1;
      } else {
        songIndex = 4;
      }
      songTitle = healingSound[modeIndex][songIndex];
      modeTitle = modeName[modeIndex];
    });
  }

  void nextSongPressed() {
    setState(() {
      if (songIndex < 4) {
        songIndex = songIndex + 1;
      } else {
        songIndex = 0;
      }
      songTitle = healingSound[modeIndex][songIndex];
      modeTitle = modeName[modeIndex];
    });
  }

  void previousFolderPressed() {
    setState(() {
      if (modeIndex > 0) {
        modeIndex = modeIndex - 1;
      } else {
        modeIndex = 2;
      }
      songIndex = 0;
      songTitle = healingSound[modeIndex][songIndex];
      modeTitle = modeName[modeIndex];
    });
  }

  void nextFolderPressed() {
    setState(() {
      if (modeIndex < 2) {
        modeIndex = modeIndex + 1;
      } else {
        modeIndex = 0;
      }
      songIndex = 0;
      songTitle = healingSound[modeIndex][songIndex];
      modeTitle = modeName[modeIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('재생 곡목 변경'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            songTitle,
            style: TextStyle(
              color: Theme.of(context).cardColor,
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child: Text(
              modeTitle,
              style: TextStyle(
                color: Theme.of(context).cardColor,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Center(
            child: Icon(
              Icons.library_music_outlined,
              size: 120,
              color: Theme.of(context).cardColor,
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: previousSongPressed,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 25,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.arrow_circle_left_rounded,
                              size: 30,
                              color: Colors.black,
                            ),
                            Text(
                              '이전곡',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: nextSongPressed,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 25,
                        ),
                        child: Row(
                          children: [
                            Text(
                              '다음곡',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            Icon(
                              Icons.arrow_circle_right_rounded,
                              size: 30,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: previousFolderPressed,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 25,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.arrow_circle_left_rounded,
                              size: 30,
                              color: Colors.black,
                            ),
                            Text(
                              '이전폴더',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: nextFolderPressed,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 25,
                        ),
                        child: Row(
                          children: [
                            Text(
                              '다음폴더',
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            Icon(
                              Icons.arrow_circle_right_rounded,
                              size: 30,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
