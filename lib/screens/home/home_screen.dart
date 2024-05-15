import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lala_bet_app/router/router.dart';
import 'package:lala_bet_app/screens/mysterious_fishing/mysterious_fishing_screen.dart';
import 'package:lala_bet_app/widgets/custom_icon_button.dart';
import 'package:lala_bet_app/widgets/scores/scores.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Color(0xFF221259),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CustomIconButton(
                            onTap: () {},
                            path: 'assets/images/buttons/music.svg'),
                        SizedBox(width: 10),
                        CustomIconButton(
                            onTap: () {},
                            path: 'assets/images/buttons/sound.svg'),
                      ],
                    ),
                    ScoresWidget(),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Color(0xFF7B55FF)),
                      borderRadius: BorderRadius.all(Radius.circular(35.0))),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                          onTap: () {
                            context.router.push(CityOfGodsRoute());
                          },
                          child: Image.asset('assets/images/home/gods.png')),
                      SizedBox(width: 12),
                      Column(
                        children: [
                          GestureDetector(
                              onTap: () {
                                context.router.push(SpaceAdventuresRoute());
                              },
                              child:
                                  Image.asset('assets/images/home/space.png')),
                          SizedBox(height: 12),
                          GestureDetector(
                              onTap: () {
                                context.router.push(MysteriousFishingRoute());

                              },
                              child: Image.asset(
                                  'assets/images/home/fishing.png')),
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.router.push(DailyRewardRoute());
                        },
                        child: Column(
                          children: [
                            Image.asset('assets/images/buttons/daily-bonus.png'),
                            SizedBox(height: 5),
                            Text(
                              'Daily Bonus',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          context.router.push(FortuneWheelRoute());
                        },
                        child: Column(
                          children: [
                            SvgPicture.asset('assets/images/buttons/wheel.svg'),
                            Text(
                              'Wheel of Fortune',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                        },
                        child: Column(
                          children: [
                            CustomIconButton(onTap: () {
                              context.router.push(RulesRoute());
                            }, path: 'assets/images/buttons/rules.svg'),
                            SizedBox(height: 5),
                            Text(
                              'Rules',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
