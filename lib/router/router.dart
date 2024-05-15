import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:lala_bet_app/screens/city_of_gods/city_of_gods_screen.dart';
import 'package:lala_bet_app/screens/daily_reward/daily_reward_screen.dart';
import 'package:lala_bet_app/screens/fortune_wheel/fortune_wheel_screen.dart';
import 'package:lala_bet_app/screens/home/home_screen.dart';
import 'package:lala_bet_app/screens/loading/loading_screen.dart';
import 'package:lala_bet_app/screens/lose/lose_screen.dart';
import 'package:lala_bet_app/screens/mysterious_fishing/mysterious_fishing_screen.dart';
import 'package:lala_bet_app/screens/rules/rules_screen.dart';
import 'package:lala_bet_app/screens/space_adventures/space_adventures_screen.dart';
import 'package:lala_bet_app/screens/win/win_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: LoadingRoute.page, initial: true),
    AutoRoute(page: HomeRoute.page),
    AutoRoute(page: RulesRoute.page),
    AutoRoute(page: DailyRewardRoute.page),
    AutoRoute(page: FortuneWheelRoute.page),
    AutoRoute(page: CityOfGodsRoute.page),
    AutoRoute(page: SpaceAdventuresRoute.page),
    AutoRoute(page: MysteriousFishingRoute.page),
    AutoRoute(page: WinRoute.page),
    AutoRoute(page: LoseRoute.page),

  ];
}