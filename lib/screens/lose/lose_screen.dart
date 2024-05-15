import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lala_bet_app/router/router.dart';

@RoutePage()
class LoseScreen extends StatefulWidget {
  final int arrows;
  final void Function()? onTap;

  const LoseScreen({super.key, required this.onTap, required this.arrows});

  @override
  State<LoseScreen> createState() => _LoseScreenState();
}

class _LoseScreenState extends State<LoseScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Color(0xFF221259),
        body: SafeArea(
          child: Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('assets/images/elements/lose-stars.png'),
                  Text(
                    'Game Over!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset('assets/images/elements/arrows.svg'),
                      SizedBox(width: 5),
                      Text(
                        '${widget.arrows} / 4',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.router.push(HomeRoute());
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            SvgPicture.asset('assets/images/buttons/red-btn.svg'),
                            DefaultTextStyle(
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                              child: Text('Main Menu'),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: widget.onTap,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            SvgPicture.asset('assets/images/buttons/green-btn.svg'),
                            DefaultTextStyle(
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                              child: Text('Try Again'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
