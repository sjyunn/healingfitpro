import 'package:flutter/material.dart';

class TimeChange extends StatefulWidget {
  const TimeChange({
    super.key,
  });

  @override
  State<TimeChange> createState() => _TimeChangeState();
}

class _TimeChangeState extends State<TimeChange> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TES 시간 변경'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '30:00',
            style: TextStyle(
              color: Theme.of(context).cardColor,
              fontSize: 69,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          Text(
            'TES는 하루 1~2번, 1회 30분 권장',
            style: TextStyle(
              color: Theme.of(context).cardColor,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Center(
            child: Icon(
              Icons.timer_outlined,
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
                        '5분 감소',
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
                        '5분 증가',
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
