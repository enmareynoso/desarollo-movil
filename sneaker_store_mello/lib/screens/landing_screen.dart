import 'package:flutter/material.dart';
import 'package:sneaker_store_mello/controllers/store.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key, required this.storeController});

  final StoreController storeController;

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: MaterialButton(
      onPressed: () {
        print('click');
        widget.storeController.ShopNow();
        setState(() {});
      },
      child: Text("Shop now"),
    ));
  }
}
