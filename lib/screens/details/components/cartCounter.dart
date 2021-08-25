import 'package:flutter/material.dart';
import 'package:restaurant/constants.dart';
import 'package:restaurant/screens/details/components/roundedIconButton.dart';

class CartCounter extends StatelessWidget {
  const CartCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   color: Color(0xFF1E2326),
      //   borderRadius: const BorderRadius.all(
      //     Radius.circular(40),
      //   ),
      // ),
      child: Row(
        children: [
          RoundedIconButton(
            iconData: Icons.remove,
            color: primaryColor,
            press: () {},
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: defaultPadding / 4,
            ),
            child: Text(
              "1",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
          ),
          RoundedIconButton(
            iconData: Icons.add,
            press: () {},
          )
        ],
      ),
    );
  }
}
