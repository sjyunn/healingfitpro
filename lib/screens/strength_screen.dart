import 'package:flutter/material.dart';

class StrengthChange extends StatefulWidget {
  const StrengthChange({
    super.key,
  });

  @override
  State<StrengthChange> createState() => _StrengthChangeState();
}

class _StrengthChangeState extends State<StrengthChange> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TES 세기 변경'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '5단계',
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
              '세기에 따른 느낌정도는 인체의 저항이 매번 달라지므로 시작할 때 적당한 세기를 맞춰주세요!\n사용할 때마다 세기 변경후 2~3분 후에 느낌이 없으면 한단계씩 올려주세요. ',
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
              Icons.bolt_outlined,
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
