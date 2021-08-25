import 'package:flutter/material.dart';
import 'package:restaurant/components/favBtn.dart';
import 'package:restaurant/components/price.dart';
import 'package:restaurant/constants.dart';
import 'package:restaurant/models/Food.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({Key? key, required this.food, required this.press})
      : super(key: key);

  final Food food;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: defaultPadding,
        ),
        margin: EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          color: Color(0xFF1E2326),
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Hero(
              tag: food.title!,
              child: Image.asset(food.image!),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              food.title!,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(fontWeight: FontWeight.w600, color: Colors.white),
            ),
            Text(
              "Flavours",
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Price(amount: "36.6"),
                FavouriteButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
