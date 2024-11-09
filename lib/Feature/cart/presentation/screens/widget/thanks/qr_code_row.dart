import 'package:authtest/Feature/cart/presentation/screens/widget/customize_checkout_button.dart';
import 'package:flutter/material.dart';

class QrCodeRow extends StatelessWidget {
  const QrCodeRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset("lib/core/assets/images/qurcode_icon.png"),
        const CustomizeCheckoutButton(
          style: TextStyle(
            color: Color(0xFF34A853),
            fontSize: 24,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w600,
            height: 0,
          ),
          hight: 58,
          width: 113,
          background: Colors.transparent,
          title: "paid ",
        ),
      ],
    );
  }
}
