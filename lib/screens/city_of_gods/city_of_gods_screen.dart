import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lala_bet_app/router/router.dart';
import 'package:lala_bet_app/widgets/custom_icon_button.dart';
import 'package:lala_bet_app/widgets/item_counter_widget.dart';
import 'package:lala_bet_app/widgets/scores/scores.dart';
import 'package:lala_bet_app/widgets/scores/scores_bloc/scores_bloc.dart';

@RoutePage()
class CityOfGodsScreen extends StatefulWidget {
  const CityOfGodsScreen({super.key});

  @override
  State<CityOfGodsScreen> createState() => _CityOfGodsScreenState();
}

class _CityOfGodsScreenState extends State<CityOfGodsScreen> {
  int startGameTime = DateTime.now().millisecondsSinceEpoch;

  int arrows = 0;

  int firstItem = 0;
  int secondItem = 0;
  int thirdItem = 0;
  int fourthItem = 0;

  @override
  void initState() {
    super.initState();
    initializeBoard();
  }

  List<List<String>> board = List.generate(7, (i) => List.filled(5, ""));

  int selectedRow = -1;
  int selectedColumn = -1;

  List<String> elements = [
    'assets/images/city-of-gods/1.png',
    'assets/images/city-of-gods/2.png',
    'assets/images/city-of-gods/3.png',
    'assets/images/city-of-gods/4.png',
  ];

  int coins = 0;
  bool isWin = false;
  bool _isTap = false;

  void initializeBoard() {
    for (int i = 0; i < 5; i++) {
      for (int j = 0; j < 5; j++) {
        board[i][j] = elements[Random().nextInt(4)];
      }
    }
  }

  void checkForMatchesAndSwapBack() {
    bool matchesFound = false;

    _isTap = false;
    for (int i = 0; i < 6; i++) {
      for (int j = 0; j < 3; j++) {
        if (board[i][j] == board[i][j + 1] && board[i][j] == board[i][j + 2]) {
          switch (board[i][j]) {
            case 'assets/images/city-of-gods/1.png':
              if (firstItem < 5) {
                firstItem += 1;
                if (firstItem == 5) {
                  arrows += 1;
                }
              }
            case 'assets/images/city-of-gods/2.png':
              if (secondItem < 5) {
                secondItem += 1;
                if (secondItem == 5) {
                  arrows += 1;
                }
              }
            case 'assets/images/city-of-gods/3.png':
              if (thirdItem < 5) {
                thirdItem += 1;
                if (thirdItem == 5) {
                  arrows += 1;
                }
              }
            case 'assets/images/city-of-gods/4.png':
              if (fourthItem < 5) {
                fourthItem += 1;
                if (fourthItem == 5) {
                  arrows += 1;
                }
              }
          }
          board[i][j] = elements[Random().nextInt(4)];
          board[i][j + 1] = elements[Random().nextInt(4)];
          board[i][j + 2] = elements[Random().nextInt(4)];
          setState(() {});
          matchesFound = true;
          selectedRow = -1;
          selectedColumn = -1;
          checkWin();
        }
      }
    }
    for (int j = 0; j < 5; j++) {
      for (int i = 0; i < 5; i++) {
        if (board[i][j] == board[i + 1][j] && board[i][j] == board[i + 2][j]) {
          switch (board[i][j]) {
            case 'assets/images/city-of-gods/1.png':
              if (firstItem < 5) {
                firstItem += 1;
                if (firstItem == 5) {
                  arrows += 1;
                }
              }
            case 'assets/images/city-of-gods/2.png':
              if (secondItem < 5) {
                secondItem += 1;
                if (secondItem == 5) {
                  arrows += 1;
                }
              }
            case 'assets/images/city-of-gods/3.png':
              if (thirdItem < 5) {
                thirdItem += 1;
                if (thirdItem == 5) {
                  arrows += 1;
                }
              }
            case 'assets/images/city-of-gods/4.png':
              if (fourthItem < 5) {
                fourthItem += 1;
                if (fourthItem == 5) {
                  arrows += 1;
                }
              }
          }
          board[i][j] = elements[Random().nextInt(4)];
          board[i + 1][j] = elements[Random().nextInt(4)];
          board[i + 2][j] = elements[Random().nextInt(4)];
          setState(() {});
          matchesFound = true;
          selectedRow = -1;
          selectedColumn = -1;
          checkWin();
        }
      }
    }
  }

  void checkWin() {
    if (arrows >= 4) {
      isWin = true;
      Future.delayed(const Duration(seconds: 1), () {
        context.read<ScoresBloc>().add(AddCoinsEvent(value: 1000));
        context.router.push(WinRoute(onTap: () {
          context.router.push(SpaceAdventuresRoute());
        }));
      });
    }
  }

  int endTime() {
    final int levelCountdownTimer = 3 * 60 * 1000 + 30 * 1000;
    final int timeLeft = levelCountdownTimer -
        (DateTime.now().millisecondsSinceEpoch - startGameTime);
    return DateTime.now().millisecondsSinceEpoch + timeLeft;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/city-of-gods/bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomIconButton(
                          onTap: () {
                            isWin = true;
                            context.router.push(HomeRoute());
                          },
                          path: 'assets/images/buttons/back.svg'),
                      Container(
                        padding: EdgeInsets.fromLTRB(40, 8, 40, 8),
                        decoration: BoxDecoration(
                            color: Color(0xFF1246DA),
                            borderRadius:
                                BorderRadius.all(Radius.circular(100.0))),
                        child: Center(
                          child: Text(
                            'City of the Gods',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 56,
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ScoresWidget(),
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
                            decoration: BoxDecoration(
                                color: Color(0xFF493395),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0))),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(
                                    'assets/images/elements/arrows.svg'),
                                SizedBox(width: 5),
                                Text(
                                  '$arrows / 4',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 10),
                          Container(
                            padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
                            decoration: BoxDecoration(
                                color: Color(0xFF493395),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0))),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(
                                    'assets/images/elements/timer.svg'),
                                SizedBox(width: 5),
                                CountdownTimer(
                                  endWidget: Center(
                                      child: Text(
                                    '00 : 00 : 00',
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )),
                                  textStyle: TextStyle(
                                    decoration: TextDecoration.none,
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  endTime: endTime(),
                                  onEnd: () {
                                    if (isWin == false) {
                                      context.router.push(LoseRoute(
                                          onTap: () {
                                            context.router
                                                .push(CityOfGodsRoute());
                                          },
                                          arrows: arrows));
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset('assets/images/city-of-gods/avatar.png'),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              ItemCounterWidget(
                                itemPath: 'assets/images/city-of-gods/1.png',
                                counter: '$firstItem / 5',
                                color: Color(0xFF1246DA),
                              ),
                              SizedBox(height: 10),
                              ItemCounterWidget(
                                itemPath: 'assets/images/city-of-gods/2.png',
                                counter: '$secondItem / 5',
                                color: Color(0xFF1246DA),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              ItemCounterWidget(
                                itemPath: 'assets/images/city-of-gods/3.png',
                                counter: '$thirdItem / 5',
                                color: Color(0xFF1246DA),
                              ),
                              SizedBox(height: 10),
                              ItemCounterWidget(
                                itemPath: 'assets/images/city-of-gods/4.png',
                                counter: '$fourthItem / 5',
                                color: Color(0xFF1246DA),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: 250,
                        height: 40,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset(
                                'assets/images/city-of-gods/bottom.png'),
                            Text(
                              _isTap ? 'Move Card' : 'Select Card',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 321,
                        width: 321,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Image.asset('assets/images/city-of-gods/board.png'),
                            Center(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: List.generate(5, (i) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: List.generate(5, (j) {
                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _isTap = true;
                                            if (selectedRow == -1 &&
                                                selectedColumn == -1) {
                                              selectedRow = i;
                                              selectedColumn = j;
                                            } else {
                                              if ((i == selectedRow &&
                                                      j ==
                                                          selectedColumn - 1) ||
                                                  (i == selectedRow &&
                                                      j ==
                                                          selectedColumn + 1) ||
                                                  (i == selectedRow - 1 &&
                                                      j == selectedColumn) ||
                                                  (i == selectedRow + 1 &&
                                                      j == selectedColumn)) {
                                                // Swap elements
                                                String temp = board[selectedRow]
                                                    [selectedColumn];
                                                board[selectedRow]
                                                        [selectedColumn] =
                                                    board[i][j];
                                                board[i][j] = temp;
                                                checkForMatchesAndSwapBack();
                                              } else {
                                                selectedRow = i;
                                                selectedColumn = j;
                                              }
                                            }
                                          });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: _isTap &&
                                                  i == selectedRow &&
                                                  j == selectedColumn
                                              ? AnimatedContainer(
                                                  duration: Duration(
                                                      milliseconds: 200),
                                                  child: Center(
                                                    child: Image.asset(
                                                      board[i][j],
                                                      width: 55,
                                                    ),
                                                  ),
                                                  width: _isTap &&
                                                          i == selectedRow &&
                                                          j == selectedColumn
                                                      ? 48
                                                      : 55,
                                                  height: _isTap &&
                                                          i == selectedRow &&
                                                          j == selectedColumn
                                                      ? 48
                                                      : 55,
                                                ).animate()
                                              : AnimatedContainer(
                                                  duration: Duration(
                                                      milliseconds: 200),
                                                  child: Center(
                                                    child: Image.asset(
                                                      board[i][j],
                                                      width: 55,
                                                    ),
                                                  ),
                                                  width: _isTap &&
                                                          i == selectedRow &&
                                                          j == selectedColumn
                                                      ? 48
                                                      : 55,
                                                  height: _isTap &&
                                                          i == selectedRow &&
                                                          j == selectedColumn
                                                      ? 48
                                                      : 55,
                                                ).animate(),
                                        )
                                            .animate()
                                            .fade(begin: 0.5)
                                            .scale(delay: 500.ms),
                                      );
                                    }),
                                  );
                                }),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
