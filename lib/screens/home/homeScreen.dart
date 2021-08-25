import 'package:flutter/material.dart';
import 'package:restaurant/constants.dart';
import 'package:restaurant/controller/homeController.dart';
import 'package:restaurant/models/Food.dart';
import 'package:restaurant/screens/details/detailsScreen.dart';
import 'package:restaurant/screens/home/components/cartDetailsView.dart';
import 'package:restaurant/screens/home/components/cartShortView.dart';
import 'package:restaurant/screens/home/components/foodCard.dart';
import 'package:restaurant/screens/home/components/header.dart';

class HomeScreen extends StatelessWidget {
  final controller = HomeController();

  void _onVerticalGesture(DragUpdateDetails details) {
    if (details.primaryDelta! < -0.7) {
      controller.changeHomeState(HomeState.cart);
    } else if (details.primaryDelta! > 12) {
      controller.changeHomeState(HomeState.normal);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        bottom: false,
        child: Container(
          color: bgColor,
          child: AnimatedBuilder(
            animation: controller,
            builder: (context, _) {
              return LayoutBuilder(
                builder: (context, BoxConstraints constraints) {
                  return Stack(
                    children: [
                      AnimatedPositioned(
                        duration: panelTransition,
                        top: controller.homeState == HomeState.normal
                            ? headerHeight
                            : -(constraints.maxHeight -
                                cartBarHeight * 2 -
                                headerHeight),
                        left: 0,
                        right: 0,
                        height: constraints.maxHeight -
                            headerHeight -
                            cartBarHeight,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: defaultPadding),
                          // decoration: BoxDecoration(
                          //   color: Color(0xFF1E2326),
                          //   borderRadius: const BorderRadius.only(
                          //     bottomLeft: Radius.circular(defaultPadding * 1.5),
                          //     bottomRight:
                          //         Radius.circular(defaultPadding * 1.5),
                          //   ),
                          // ),
                          child: GridView.builder(
                            itemCount: foodProducts.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.75,
                              mainAxisSpacing: defaultPadding,
                              crossAxisSpacing: defaultPadding,
                            ),
                            itemBuilder: (context, index) => FoodCard(
                              food: foodProducts[index],
                              press: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    transitionDuration: panelTransition,
                                    reverseTransitionDuration: panelTransition,
                                    pageBuilder: (context, animation,
                                            secondaryAnimation) =>
                                        FadeTransition(
                                      opacity: animation,
                                      child: DetailScreen(
                                        food: foodProducts[index],
                                        onFoodAdd: () {
                                          controller.addFoodToCart(
                                              foodProducts[index]);
                                        },
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                      AnimatedPositioned(
                        duration: panelTransition,
                        bottom: 0,
                        left: 0,
                        right: 0,
                        height: controller.homeState == HomeState.normal
                            ? cartBarHeight
                            : (constraints.maxHeight - cartBarHeight),
                        child: GestureDetector(
                          onVerticalDragUpdate: _onVerticalGesture,
                          child: Container(
                            padding: const EdgeInsets.all(defaultPadding),
                            color: Color(0xFF1E2326),
                            alignment: Alignment.topLeft,
                            child: AnimatedSwitcher(
                              duration: panelTransition,
                              child: controller.homeState == HomeState.normal
                                  ? CardShortView(controller: controller)
                                  : CartDetailsView(controller: controller),
                            ),
                          ),
                        ),
                      ),
                      AnimatedPositioned(
                        child: WelcomeHeader(),
                        duration: panelTransition,
                        top: controller.homeState == HomeState.normal
                            ? 0
                            : -headerHeight,
                        right: 0,
                        left: 0,
                        height: headerHeight,
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
