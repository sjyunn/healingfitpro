import 'package:flutter/material.dart';

class ModeChange extends StatelessWidget {
  const ModeChange({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('모드 변경'),
      ),
      body: const Center(
        child: Text('여기는 힐링핏 모드를 변경하는 곳'),
      ),
    );
  }
}
