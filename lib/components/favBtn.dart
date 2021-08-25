import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FavouriteButton extends StatelessWidget {
  const FavouriteButton({Key? key, this.radius = 12,}) : super(key: key);

  final double radius;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Color(0xFF090B0C),
      child: SvgPicture.asset("assets/icons/heart.svg"),
    );
  }
}
