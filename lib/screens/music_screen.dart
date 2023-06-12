import 'package:flutter/material.dart';

class MusicChange extends StatefulWidget {
  const MusicChange({
    super.key,
  });

  @override
  State<MusicChange> createState() => _MusicChangeState();
}

class _MusicChangeState extends State<MusicChange> {
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
            '비오는날(A RAINY DAT)',
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
              '학습모드',
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
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).splashColor,
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
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).highlightColor,
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
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).splashColor,
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
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).highlightColor,
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
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
