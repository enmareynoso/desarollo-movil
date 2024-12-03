import 'package:flutter/material.dart';
import 'package:foodsocialapp/screens/explore_screen.dart';
import 'package:foodsocialapp/screens/recipes_screen.dart';
import 'package:foodsocialapp/screens/tobuy_screen.dart';

import 'components/theme_button.dart';

class Home extends StatefulWidget {
  Home({super.key, required this.appTitle, required this.ChangeThemeMode});

  final appTitle;
  final Function ChangeThemeMode;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentScreen = 0;
  List<Widget> screens = [ExploreScreen(), RecipesScreen(), TobuyScreen()];

  void ChangeScreen(int index) {
    setState(() {
      currentScreen = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.appTitle,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        actions: [
          //Button
          ThemeButton(changeTheme: widget.ChangeThemeMode)
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          onTap: (value) {
            ChangeScreen(value);
          },
          currentIndex: currentScreen,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.explore), label: "EXPLORE"),
            BottomNavigationBarItem(
                icon: Icon(Icons.card_giftcard), label: "Recipes"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: "to Buy")
          ]),
      body: screens[currentScreen],
    );
  }
}
