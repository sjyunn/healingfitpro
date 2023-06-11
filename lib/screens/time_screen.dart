import 'package:flutter/material.dart';

class TimeChange extends StatelessWidget {
  const TimeChange({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TES 시간 변경'),
      ),
      body: const Center(
        child: Text('여기는 TES 동작 시간을 변경하는 곳'),
      ),
    );
  }
}
