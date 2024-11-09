import 'package:authtest/core/styles/font_styles.dart';
import 'package:flutter/material.dart';

class LoginTitle extends StatelessWidget {
  const LoginTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Login',
      textAlign: TextAlign.center,
      style: FontStyles.titlestyle,
    );
  }
}
