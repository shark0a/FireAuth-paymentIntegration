import 'package:authtest/Feature/cart/presentation/screens/widget/customize_appbar.dart';
import 'package:authtest/Feature/cart/presentation/screens/widget/payement_details/payment_details_screen_body.dart';
import 'package:flutter/material.dart';

class PaymentDetailsScreen extends StatelessWidget {
  const PaymentDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customizeAppBar(context, 'Payment-Details'),
      body: const Padding(
        padding: EdgeInsets.all(8.0),
        child: PaymentDetailsScreenBody(),
      ),
    );
  }
}
