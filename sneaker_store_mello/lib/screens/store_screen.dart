import 'package:flutter/material.dart';
import 'package:sneaker_store_mello/controllers/store.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key, required this.storeController});

  final StoreController storeController;

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Store screen"));
  }
}
