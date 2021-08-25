import 'package:flutter/material.dart';
import 'package:restaurant/constants.dart';
import 'package:restaurant/controller/homeController.dart';
import 'package:restaurant/screens/home/components/cartDetailsViewCard.dart';

class CartDetailsView extends StatelessWidget {
  const CartDetailsView({Key? key, required this.controller}) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text("Cart",
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: Colors.white)),
          ...List.generate(
            controller.cart.length,
            (index) => CartDetailsViewCard(foodItem: controller.cart[index]),
          ),
          SizedBox(
            height: defaultPadding,
          ),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {},
              child: Text("Next - \₺36"),
            ),
          ),
        ],
      ),
    );
  }
}
