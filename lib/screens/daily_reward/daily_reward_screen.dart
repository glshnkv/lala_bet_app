import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lala_bet_app/router/router.dart';
import 'package:lala_bet_app/screens/daily_reward/daily_reward_bloc/daily_reward_bloc.dart';
import 'package:lala_bet_app/widgets/action_button_widget.dart';
import 'package:lala_bet_app/widgets/custom_icon_button.dart';
import 'package:lala_bet_app/widgets/scores/scores.dart';

@RoutePage()
class DailyRewardScreen extends StatefulWidget {
  const DailyRewardScreen({super.key});

  @override
  State<DailyRewardScreen> createState() => _DailyRewardScreenState();
}

class _DailyRewardScreenState extends State<DailyRewardScreen> {
  List<int> rewards = [0, 50, 100];
  bool _isChosen = false;
  int _indexRandomReward = 1;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Color(0xFF221259),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: BlocProvider(
              create: (context) =>
                  DailyRewardBloc()..add(CheckDailyRewardEvent()),
              child: BlocBuilder<DailyRewardBloc, DailyRewardState>(
                builder: (context, state) {
                  if (state is SuccessDailyRewardState) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomIconButton(
                                onTap: () {
                                  context.router.push(HomeRoute());
                                },
                                path: 'assets/images/buttons/back.svg'),
                            ScoresWidget()
                          ],
                        ),
                        Image.asset('assets/images/daily-reward/image.png'),
                        Column(
                          children: [
                            Text(
                              'Daily Reward',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Choose one of the boxes and find out about the reward',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 25),
                            !_isChosen
                                ? Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          _indexRandomReward =
                                              Random().nextInt(3);
                                          setState(() {
                                            _isChosen = true;
                                          });
                                        },
                                        child: Image.asset(
                                            'assets/images/daily-reward/close-card.png'),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          _indexRandomReward =
                                              Random().nextInt(3);
                                          setState(() {
                                            _isChosen = true;
                                          });
                                        },
                                        child: Image.asset(
                                            'assets/images/daily-reward/close-card.png'),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          _indexRandomReward =
                                              Random().nextInt(3);
                                          setState(() {
                                            _isChosen = true;
                                          });
                                        },
                                        child: Image.asset(
                                            'assets/images/daily-reward/close-card.png'),
                                      ),
                                    ],
                                  )
                                : Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(20),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20.0)),
                                            color: Color(0xFF402971)),
                                        child: rewards[_indexRandomReward] != 0
                                            ? Row(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  SvgPicture.asset(
                                                      'assets/images/elements/coin.svg'),
                                                  SizedBox(width: 5),
                                                  DefaultTextStyle(
                                                    style: TextStyle(
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.white),
                                                    child: Text(
                                                      '${rewards[_indexRandomReward]}',
                                                    ),
                                                  ),
                                                ],
                                              )
                                            : Text(
                                                'Try Again Later...',
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white),
                                              ),
                                      ),
                                      SizedBox(height: 25),
                                      ActionButtonWidget(
                                          text: rewards[_indexRandomReward] != 0
                                              ? 'Recieve'
                                              : 'OK',
                                          onTap: () {
                                            context.read<DailyRewardBloc>().add(
                                                GetDailyRewardEvent(
                                                    coins: rewards[
                                                        _indexRandomReward]));
                                            context.router.push(HomeRoute());
                                          }),
                                    ],
                                  ),
                          ],
                        ),
                        SizedBox(height: 5),
                      ],
                    );
                  } else if (state is FailureDailyRewardState) {
                    return Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomIconButton(
                                  onTap: () {
                                    context.router.push(HomeRoute());
                                  },
                                  path: 'assets/images/buttons/back.svg'),
                              ScoresWidget(),
                            ],
                          ),
                          Image.asset('assets/images/daily-reward/image.png'),
                          Column(
                            children: [
                              DefaultTextStyle(
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                                child: Text(
                                  'Daily Reward',
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                  'You have already collected a daily reward recently. Come back through:',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                              SizedBox(height: 25),
                              Container(
                                padding: EdgeInsets.all(20),
                                width: 200,
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                                    color: Color(0xFF402971)),
                                child: Center(
                                  child: CountdownTimer(
                                    textStyle: TextStyle(
                                      decoration: TextDecoration.none,
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                    endTime: DateTime.now().millisecondsSinceEpoch +
                                        state.timeLeft,
                                  ),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(height: 5),
                        ],
                      ),
                    );
                  }
                  return Container();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
