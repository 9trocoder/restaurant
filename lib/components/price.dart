import 'package:flutter/material.dart';
import 'package:restaurant/constants.dart';

class Price extends StatelessWidget {
  const Price({Key? key, required this.amount}) : super(key: key);

  final String amount;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: "\₺",
        style: Theme.of(context).textTheme.subtitle1!.copyWith(
              fontWeight: FontWeight.w600,
              color: priceColor,
            ),
        children: [
          TextSpan(
            text: amount,
            style: TextStyle(
              color: priceColor,
            ),
          ),
        ],
      ),
    );
  }
}


// 1E2326