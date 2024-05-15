import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ActionButtonWidget extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  const ActionButtonWidget(
      {super.key, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SvgPicture.asset('assets/images/buttons/action-btn.svg'),
          DefaultTextStyle(
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Colors.white),
            child: Text(text),
          ),
        ],
      ),
    );
  }
}