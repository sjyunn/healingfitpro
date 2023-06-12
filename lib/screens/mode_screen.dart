import 'package:flutter/material.dart';

class ModeChange extends StatefulWidget {
  const ModeChange({
    super.key,
  });

  @override
  State<ModeChange> createState() => _ModeChangeState();
}

class _ModeChangeState extends State<ModeChange> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('모드 변경'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '힐링모드',
            style: TextStyle(
              color: Theme.of(context).cardColor,
              fontSize: 50,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 100,
          ),
          Text(
            '힐링모드/학습모드/수면모드',
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
              Icons.airline_seat_recline_normal,
              size: 120,
              color: Theme.of(context).cardColor,
            ),
          ),
          const SizedBox(
            height: 100,
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
              child: Text(
                '모드 변경',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
