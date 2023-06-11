import 'package:flutter/material.dart';

class VolumnChange extends StatelessWidget {
  const VolumnChange({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('소리 크기 변경'),
      ),
      body: const Center(
        child: Text('여기는 소리 크기를 변경하는 곳'),
      ),
    );
  }
}
