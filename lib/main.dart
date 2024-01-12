// main.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rock_paper_scissors/game_controller.dart';
import 'package:rock_paper_scissors/game_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(GameController());
    return const GetCupertinoApp(
      title: 'Rock, Paper, Scissors',
      home: GameView(),
    );
  }
}
