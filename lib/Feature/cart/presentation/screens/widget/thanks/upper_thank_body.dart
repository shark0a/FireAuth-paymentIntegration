import 'package:authtest/Feature/cart/presentation/screens/widget/thanks/upper_thank_info.dart';
import 'package:flutter/material.dart';

class ThankInfoBody extends StatelessWidget {
  const ThankInfoBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60),
      child: Container(
        width: MediaQuery.sizeOf(context).width,
        decoration: ShapeDecoration(
          color: const Color(0xFFE6E5E5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: const ThankInfo(),
      ),
    );
  }
}
