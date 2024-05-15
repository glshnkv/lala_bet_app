import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomIconButton extends StatelessWidget {
  final void Function()? onTap;
  final String path;
  const CustomIconButton({super.key, required this.onTap, required this.path});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(path),
    );
  }
}
