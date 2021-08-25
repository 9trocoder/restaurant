import 'package:flutter/material.dart';
import 'package:restaurant/components/favBtn.dart';
import 'package:restaurant/components/price.dart';
import 'package:restaurant/constants.dart';
import 'package:restaurant/models/Food.dart';
import 'package:restaurant/screens/details/components/cartCounter.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key, required this.food, required this.onFoodAdd})
      : super(key: key);

  final Food food;
  final VoidCallback onFoodAdd;

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  String _cartTag = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: defaultPadding,
            ),
            child: ElevatedButton(
              onPressed: () {
                widget.onFoodAdd();
                setState(() {
                  _cartTag = '_cartTag';
                });
                Navigator.pop(context);
              },
              child: Text(
                "Add to cart",
              ),
            ),
          ),
        ),
      ),
      backgroundColor: bgColor,
      appBar: buildAppBar(),
      body: Column(
        children: [
          AspectRatio(
            aspectRatio: 1.37,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    child: Hero(
                      tag: widget.food.title! + _cartTag,
                      child: Image.asset(widget.food.image!),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Positioned(
                  bottom: -20,
                  child: CartCounter(),
                ),
              ],
            ),
          ),
          SizedBox(
            height: defaultPadding * 1.5,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: defaultPadding,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    widget.food.title!,
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                Price(amount: "36"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Text(
              "This contains the food products and about the food. there is so much to come from us.",
              style: TextStyle(
                color: Color(0xFFBDBDBD),
                height: 1.8,
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      leading: BackButton(
        color: Colors.white,
      ),
      backgroundColor: Color(0xFF1E2326),
      elevation: 0,
      centerTitle: true,
      title: Text(
        "Yemek",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      actions: [
        FavouriteButton(radius: 20),
        SizedBox(
          width: defaultPadding,
        ),
      ],
    );
  }
}
