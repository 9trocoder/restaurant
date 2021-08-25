import 'package:restaurant/models/Food.dart';

class FoodItems {
  int quantity;
  final Food? food;

  FoodItems({this.quantity = 1, required this.food});

  void increment() {
    quantity++;
  }
}
