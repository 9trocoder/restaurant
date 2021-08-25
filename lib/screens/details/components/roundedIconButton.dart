import 'package:flutter/material.dart';
import 'package:restaurant/constants.dart';

class RoundedIconButton extends StatelessWidget {
  const RoundedIconButton(
      {Key? key,
      required this.iconData,
      this.color = primaryColor,
      required this.press})
      : super(key: key);

  final IconData iconData;
  final Color color;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: press,
      padding: EdgeInsets.zero,
      shape: CircleBorder(),
      elevation: 0,
      color: Colors.white,
      height: 36,
      minWidth: 36,
      child: Icon(
        iconData,
        color: color,
      ),
    );
  }
}
