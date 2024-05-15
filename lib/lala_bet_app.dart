import 'package:flutter/material.dart';
import 'package:lala_bet_app/router/router.dart';

class LaLaBetApp extends StatelessWidget {
  LaLaBetApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(fontFamily: 'Poppins'),
      routerConfig: _appRouter.config(),
      debugShowCheckedModeBanner: false,
    );
  }
}
