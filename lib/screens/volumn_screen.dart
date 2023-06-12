import 'package:flutter/material.dart';

class VolumnChange extends StatefulWidget {
  const VolumnChange({
    super.key,
  });

  @override
  State<VolumnChange> createState() => _VolumnChangeState();
}

class _VolumnChangeState extends State<VolumnChange> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('소리 크기 변경'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '7단계',
            style: TextStyle(
              color: Theme.of(context).cardColor,
              fontSize: 69,
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
              '적당한 소리 크기로 조정하세요!',
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
              Icons.volume_up_outlined,
              size: 120,
              color: Theme.of(context).cardColor,
            ),
          ),
          const SizedBox(
            height: 100,
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
                      Text(
                        '1단계 감소',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Icon(
                        Icons.arrow_circle_down_rounded,
                        size: 30,
                        color: Colors.black,
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
                        '1단계 증가',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      Icon(
                        Icons.arrow_circle_up_rounded,
                        size: 30,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
