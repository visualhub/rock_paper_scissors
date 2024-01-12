// game_view.dart
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rock_paper_scissors/game_controller.dart';

class GameView extends GetView<GameController> {
  const GameView({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Container(
        color: Colors.black12,
        padding: const EdgeInsets.symmetric(
          vertical: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Text('Results: ${controller.result.value}'),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: Get.height * 0.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Hello World!',
                  ),
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _gameTile(
                          gameCard: true,
                          svgPicture: SvgPicture.asset(
                            'assets/icons/svgs/scissors.svg',
                            color: controller.selection.value == 'scissors'
                                ? Colors.blue
                                : Colors.black,
                          ),
                        ),
                        _gameTile(
                          gameCard: true,
                          svgPicture: SvgPicture.asset(
                            'assets/icons/svgs/rock.svg',
                            color: controller.selection.value == 'rock'
                                ? Colors.blue
                                : Colors.black,
                          ),
                        ),
                        _gameTile(
                          gameCard: true,
                          svgPicture: SvgPicture.asset(
                            'assets/icons/svgs/paper.svg',
                            color: controller.selection.value == 'paper'
                                ? Colors.blue
                                : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Obx(
                    () => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _gameTile(
                          onTap: controller.isPlaying.value
                              ? () {
                                  controller.userCardSelection('rock');
                                }
                              : null,
                          svgPicture: SvgPicture.asset(
                            'assets/icons/svgs/rock.svg',
                            color: _getCardColor('rock'),
                          ),
                        ),
                        _gameTile(
                          onTap: controller.isPlaying.value
                              ? () {
                                  controller.userCardSelection('paper');
                                }
                              : null,
                          svgPicture: SvgPicture.asset(
                            'assets/icons/svgs/paper.svg',
                            color: _getCardColor('paper'),
                          ),
                        ),
                        _gameTile(
                          onTap: controller.isPlaying.value
                              ? () {
                                  controller.userCardSelection('scissors');
                                }
                              : null,
                          svgPicture: SvgPicture.asset(
                            'assets/icons/svgs/scissors.svg',
                            color: _getCardColor('scissors'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    height: 60,
                    width: 120,
                    child: CupertinoButton(
                      child: const Text(
                        'Start Game',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        controller.startGame();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getCardColor(String cardType) {
    return controller.playerSelection.value == cardType
        ? _getResultColor()
        : Colors.black;
  }

  Color _getResultColor() {
    return switch (controller.result.value) {
      'You win!' => Colors.green,
      "It's a draw!" => Colors.blue,
      "Computer wins!" => Colors.red,
      _ => Colors.black,
    };
  }

  SizedBox _gameTile({
    required SvgPicture svgPicture,
    VoidCallback? onTap,
    bool gameCard = false,
  }) {
    return SizedBox(
      height: 120,
      width: 120,
      child: CupertinoButton(
        onPressed: onTap,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.amber,
          ),
          child: gameCard
              ? controller.isPlaying.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : svgPicture
              : svgPicture,
        ),
      ),
    );
  }
}
