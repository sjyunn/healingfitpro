import 'package:flutter/material.dart';

class MusicChange extends StatelessWidget {
  const MusicChange({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('재생 곡목 변경'),
      ),
      body: const Center(
        child: Text('여기는 재생 음악을 변경하는 곳'),
      ),
    );
  }
}
