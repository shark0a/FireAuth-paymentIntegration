import 'package:authtest/Feature/cart/presentation/screens/widget/my_cart/cart_body.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Center(
            child: FaIcon(
              FontAwesomeIcons.arrowLeftLong,
              size: 35,
            ),
          ),
        ),
        title: const Text('My-Cart'),
        centerTitle: true,
      ),
      body: const CartBody(),
    );
  }
}
