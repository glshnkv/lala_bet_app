import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lala_bet_app/router/router.dart';
import 'package:lala_bet_app/screens/fortune_wheel/fortune_wheel_bloc/fortune_wheel_bloc.dart';
import 'package:lala_bet_app/widgets/action_button_widget.dart';
import 'package:lala_bet_app/widgets/custom_icon_button.dart';
import 'package:lala_bet_app/widgets/scores/scores.dart';

enum BonusType { coins, hearts }

@RoutePage()
class FortuneWheelScreen extends StatefulWidget {
  const FortuneWheelScreen({super.key});

  @override
  State<FortuneWheelScreen> createState() => _FortuneWheelScreenState();
}

class _FortuneWheelScreenState extends State<FortuneWheelScreen> {
  StreamController<int> controller = StreamController<int>();

  int resultIndex = 0;

  final List<String> items = [
    '0',
    '10',
    '3',
    '50',
    '1',
    '100',
    '2',
    '200',
  ];

  @override
  void dispose() {
    controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Color(0xFF221259),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
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
              ),
              Container(
                padding: EdgeInsets.fromLTRB(30, 12, 30, 12),
                decoration: BoxDecoration(
                    color: Color(0xFF644FA9),
                    borderRadius: BorderRadius.all(Radius.circular(100.0))),
                child: Text(
                  'Wheel of Fortune',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ),
              Container(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset('assets/images/fortune/wheel-shadow.png'),
                    Container(
                      width: 330,
                      height: 330,
                      decoration: BoxDecoration(
                          color: Color(0xFF66BFFF),
                          borderRadius:
                              BorderRadius.all(Radius.circular(1000.0))),
                    ),
                    Container(
                      width: 320,
                      height: 320,
                      decoration: BoxDecoration(
                          color: Color(0xFF240F6A),
                          borderRadius:
                              BorderRadius.all(Radius.circular(1000.0))),
                    ),
                    SizedBox(
                      width: 310,
                      height: 310,
                      child: FortuneWheel(
                        physics: NoPanPhysics(),
                        animateFirst: false,
                        selected: controller.stream,
                        items: [
                          for (var item in items)
                            FortuneItem(
                              child: int.parse(item) < 10
                                  ? Row(
                                      children: [
                                        SizedBox(width: 80),
                                        SvgPicture.asset(
                                            'assets/images/elements/heart.svg'),
                                        SizedBox(width: 5),
                                        Text(
                                          item,
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white),
                                        ),
                                      ],
                                    )
                                  : Row(
                                      children: [
                                        SizedBox(width: 80),
                                        SvgPicture.asset(
                                            'assets/images/elements/coin.svg'),
                                        SizedBox(width: 5),
                                        Text(
                                          item,
                                          style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                              style: FortuneItemStyle(
                                borderWidth: 0,
                                color: int.parse(item) < 10
                                    ? Color(0xFF2CB4D2)
                                    : Color(0xFF512CD2),
                              ),
                            ),
                        ],
                        indicators: <FortuneIndicator>[
                          FortuneIndicator(
                            alignment: Alignment.center,
                            child: SvgPicture.asset(
                                'assets/images/fortune/indicator.svg'),
                          ),
                        ],
                        onAnimationEnd: () {
                          _winDialog();
                        },
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 270,
                child: Text(
                  'This is a daily quiz where you can win the necessary bonuses for yourself. Carried out only once a day',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFB2A9FF)),
                  textAlign: TextAlign.center,
                ),
              ),
              BlocProvider(
                create: (context) =>
                    FortuneWheelBloc()..add(CheckFortuneWheelEvent()),
                child: BlocBuilder<FortuneWheelBloc, FortuneWheelState>(
                  builder: (context, state) {
                    if (state is SuccessFortuneWheelState) {
                      return ActionButtonWidget(
                          text: 'Spin',
                          onTap: () {
                            resultIndex = Fortune.randomInt(0, items.length);
                            controller.add(resultIndex);
                          });
                    } else if (state is FailureFortuneWheelState) {
                      return Column(
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              SvgPicture.asset(
                                  'assets/images/fortune/timer-bg.svg'),
                              Center(
                                child: Text(
                                  'Spin',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Next Spin in ',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFFB2A9FF)),
                              ),
                              CountdownTimer(
                                textStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFFB2A9FF)),
                                endTime: DateTime.now().millisecondsSinceEpoch +
                                    state.timeLeft,
                              ),
                            ],
                          ),
                        ],
                      );
                    }

                    return Container();
                  },
                ),
              ),
              SizedBox(height: 5),
            ],
          ),
        ),
      ),
    );
  }

  void _winDialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: SizedBox(
            height: 340,
            width: 340,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  border: Border.all(color: Color(0xFFFFC700), width: 5),
                  color: Color(0xFF1C007D)),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset('assets/images/fortune/image.svg'),
                      Text(
                        'Your Reward:',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                      SizedBox(height: 25),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(int.parse(items[resultIndex]) < 10
                              ? 'assets/images/elements/heart.svg'
                              : 'assets/images/elements/coin.svg'),
                          SizedBox(width: 5),
                          Text(
                            items[resultIndex],
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(height: 25),
                      ActionButtonWidget(
                          text: 'Recieve',
                          onTap: () {
                            context.read<FortuneWheelBloc>().add(
                                GetFortuneBonusEvent(
                                    type: int.parse(items[resultIndex]) < 10
                                        ? BonusType.hearts
                                        : BonusType.coins,
                                    value: int.parse(items[resultIndex])));
                            context.router.push(HomeRoute());
                          }),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
