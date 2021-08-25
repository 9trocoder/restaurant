import 'package:flutter/material.dart';
import 'package:restaurant/components/price.dart';
import 'package:restaurant/constants.dart';
import 'package:restaurant/models/FoodItems.dart';

class CartDetailsViewCard extends StatelessWidget {
  const CartDetailsViewCard({Key? key, required this.foodItem})
      : super(key: key);

  final FoodItems foodItem;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        vertical: defaultPadding / 2,
      ),
      leading: CircleAvatar(
        radius: 25,
        backgroundColor: Color(0xFF1E2326),
        backgroundImage: AssetImage(foodItem.food!.image!),
      ),
      title: Text(
        foodItem.food!.title!,
        style: Theme.of(context)
            .textTheme
            .subtitle1!
            .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
      ),
      trailing: FittedBox(
        child: Row(
          children: [
            Price(amount: "36"),
            Text(
              " x ${foodItem.quantity}",
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
