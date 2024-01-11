import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GameController extends GetxController {
  RxBool isPlaying = false.obs;
  final selection = "".obs;
  final playerSelection = "".obs;
  final result = "".obs;

  void startGame() {
    isPlaying.value = true;
    _gameCardSelection();
  }

  void _gameCardSelection() {
    final colors = [
      'rock',
      'paper',
      'scissors',
    ];
    final randomCard = colors[DateTime.now().millisecond % 3];
    selection.value = randomCard;
    debugPrint(selection.value);
  }

  void userCardSelection(String playerCard) {
    playerSelection.value = playerCard;
    checkUserInput();
  }

  void checkUserInput() {
    if (selection.value == playerSelection.value) {
      result.value = 'It\'s a draw!';
    } else if ((selection.value == 'rock' &&
            playerSelection.value == 'paper') ||
        (selection.value == 'paper' && playerSelection.value == 'scissors') ||
        (selection.value == 'scissors' && playerSelection.value == 'rock')) {
      result.value = 'You win!';
    } else {
      result.value = 'Computer wins!';
    }
    isPlaying.value = false;
    debugPrint(playerSelection.value);
    debugPrint(result.value);
  }

  void endGame() {
    isPlaying.value = false;
    Get.snackbar(
      'Game Over',
      'Your Loos',
    );
  }
}
