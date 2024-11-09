import 'package:authtest/core/styles/font_styles.dart';
import 'package:flutter/material.dart';

class BuildPhoneNumberText extends StatelessWidget {
  const BuildPhoneNumberText({
    super.key,
    required this.emailAddress,
  });

  final String? emailAddress;

  @override
  Widget build(BuildContext context) {
    return Text(
      emailAddress != null
          ? "Enter the 6 digit code sent to\n$emailAddress"
          : "Loading Email Adress...",
      textAlign: TextAlign.center,
      style: FontStyles.titlestyle.copyWith(fontSize: 20),
    );
  }
}
