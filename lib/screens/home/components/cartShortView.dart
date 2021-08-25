import 'package:flutter/material.dart';
import 'package:restaurant/constants.dart';
import 'package:restaurant/controller/homeController.dart';

class CardShortView extends StatelessWidget {
  const CardShortView({Key? key, required this.controller}) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Cart",
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: Colors.white),
        ),
        const SizedBox(
          width: defaultPadding,
        ),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                controller.cart.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(
                    right: defaultPadding / 2,
                  ),
                  child: Hero(
                    tag: controller.cart[index].food!.title! + "_cartTag",
                    child: CircleAvatar(
                      backgroundColor: Color(0xFF1E2326),
                      backgroundImage:
                          AssetImage(controller.cart[index].food!.image!),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        CircleAvatar(
          backgroundColor: Color(0xFF1E2326),
          child: Text(
            controller.totalCartItems().toString(),
            style: TextStyle(fontWeight: FontWeight.bold, color: primaryColor),
          ),
        ),
      ],
    );
  }
}
