import 'package:flutter/material.dart';
import 'package:restaurant/models/Food.dart';
import 'package:restaurant/models/FoodItems.dart';

enum HomeState { normal, cart }

class HomeController extends ChangeNotifier {
  HomeState homeState = HomeState.normal;

  List<FoodItems> cart = [];

  void changeHomeState(HomeState state) {
    homeState = state;
    notifyListeners();
  }

  void addFoodToCart(Food food) {
    for (FoodItems item in cart) {
      if (item.food!.title == food.title) {
        item.increment();
        notifyListeners();
        return;
      }
    }

    cart.add(FoodItems(food: food));
    notifyListeners();
  }

  int totalCartItems() => cart.fold(
      0, (previousValue, element) => previousValue + element.quantity);
}
