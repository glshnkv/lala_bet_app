import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lala_bet_app/widgets/custom_icon_button.dart';

@RoutePage()
class RulesScreen extends StatefulWidget {
  const RulesScreen({super.key});

  @override
  State<RulesScreen> createState() => _RulesScreenState();
}

class _RulesScreenState extends State<RulesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF221259),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomIconButton(
                        onTap: () {
                          context.router.pop();
                        },
                        path: 'assets/images/buttons/back.svg'),
                    Container(
                      padding: EdgeInsets.fromLTRB(40, 8, 40, 8),
                      decoration: BoxDecoration(
                          color: Color(0xFF493395),
                          borderRadius:
                              BorderRadius.all(Radius.circular(100.0))),
                      child: Center(
                        child: Text(
                          'Rules',
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
                SizedBox(height: 25),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'You need to collect a given number of combinations of elements in the allotted time by moving various cards.',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    Image.asset('assets/images/rules/moves.png'),
                    Text(
                      'Victory occurs when the total number of combinations (4) is collected. To do this, you need to collect combinations of each element, and the required number of them.',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    SizedBox(height: 25),
                    SvgPicture.asset('assets/images/rules/combos.svg'),
                    SizedBox(height: 25),
                    Text(
                      'For each combination, you will be awarded coins. If you successfully complete several combinations at once, the amount of coins multiplies depending on the number of simultaneous combinations.',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    SizedBox(height: 25),
                    Image.asset('assets/images/rules/elements.png'),
                    SizedBox(height: 25),
                    Text(
                      'You have extra hearts, which you will lose during unsuccessful attempts to collect a combination. You can purchase them for additional coins or win them in the daily Wheel of Fortune quiz, or the Daily Bonus.',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
