import 'package:authtest/Feature/cart/presentation/screens/widget/customize_checkout_button.dart';
import 'package:authtest/Feature/cart/presentation/screens/widget/payement_details/payment_methode.dart';
import 'package:authtest/core/styles/font_styles.dart';
import 'package:authtest/core/styles/fonts/font_colors.dart';
import 'package:flutter/material.dart';

class PyamentButtomSheetBody extends StatelessWidget {
  const PyamentButtomSheetBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 30),
        const Text(
          'Payment Method',
          style: FontStyles.blod,
        ),
        const SizedBox(height: 30),
        const PaymentMethods(),
        const SizedBox(
          height: 30,
        ),
        CustomizeCheckoutButton(
            title: "Continue",
            width: 200,
            background: FontColors.checkOutButtonColor,
            hight: 70),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
