import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/cards_controller.dart';

class CardsView extends GetView<CardsController> {
  const CardsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: const Center(
        child: Text(
          'CardsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
