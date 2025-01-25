import 'package:flutter/material.dart';
import 'package:sneaker_store_mello/controllers/store.dart';
import 'package:sneaker_store_mello/screens/landing_screen.dart';
import 'package:sneaker_store_mello/screens/store_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final StoreController _storeController = StoreController();

  Widget getCurrentScreen() {
    return !_storeController.onLandingScreen
        ? LandingScreen(
            storeController: _storeController,
          )
        : StoreScreen(
            storeController: _storeController,
          );
  }

  @override
  Widget build(BuildContext context) {
    return getCurrentScreen();
  }
}
