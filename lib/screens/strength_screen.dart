import 'package:flutter/material.dart';

class StrengthChange extends StatelessWidget {
  const StrengthChange({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TES 세기 변경'),
      ),
      body: const Center(
        child: Text('여기는 TES 동작 세기를 변경하는 곳'),
      ),
    );
  }
}
