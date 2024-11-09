import 'package:authtest/core/styles/font_styles.dart';
import 'package:authtest/core/styles/fonts/font_colors.dart';
import 'package:flutter/material.dart';

class BuildResendCodeButton extends StatelessWidget {
  const BuildResendCodeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle resend code
      },
      child: Text(
        "Resend code",
        textAlign: TextAlign.center,
        style: FontStyles.smallstyle.copyWith(
          decoration: TextDecoration.underline,
          fontSize: 17,
          fontWeight: FontWeight.bold,
          color: FontColors.primaryColor,
        ),
      ),
    );
  }
}
