import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lala_bet_app/lala_bet_app.dart';
import 'package:lala_bet_app/screens/daily_reward/daily_reward_bloc/daily_reward_bloc.dart';
import 'package:lala_bet_app/screens/fortune_wheel/fortune_wheel_bloc/fortune_wheel_bloc.dart';
import 'package:lala_bet_app/widgets/scores/scores_bloc/scores_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<ScoresBloc>(create: (context) => ScoresBloc()),
        BlocProvider<DailyRewardBloc>(create: (context) => DailyRewardBloc()),
        BlocProvider<FortuneWheelBloc>(create: (context) => FortuneWheelBloc()),
      ],
      child: LaLaBetApp(),
    ),
  );
}
