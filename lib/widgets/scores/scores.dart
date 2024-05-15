import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lala_bet_app/widgets/scores/scores_bloc/scores_bloc.dart';

class ScoresWidget extends StatefulWidget {
  const ScoresWidget({super.key});

  @override
  State<ScoresWidget> createState() => _ScoresWidgetState();
}

class _ScoresWidgetState extends State<ScoresWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ScoresBloc()..add(GetScoresEvent()),
      child: BlocBuilder<ScoresBloc, ScoresState>(
        builder: (context, state) {
          if (state is UpdateScoresState) {
            return Row(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
                  decoration: BoxDecoration(
                      color: Color(0xFF493395),
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset('assets/images/elements/coin.svg'),
                      SizedBox(width: 5),
                      Text(
                        state.coins.toString(),
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
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset('assets/images/elements/heart.svg'),
                      SizedBox(width: 5),
                      Text(
                        state.hearts.toString(),
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            );

          }
          return Container();
        },
      ),
    );
  }
}
