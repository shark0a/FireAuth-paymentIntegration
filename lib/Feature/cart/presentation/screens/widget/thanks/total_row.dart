import 'package:authtest/core/styles/font_styles.dart';
import 'package:flutter/material.dart';

class TotalRow extends StatelessWidget {
  const TotalRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Total",
          style: FontStyles.blod,
        ),
        Text(
          "\$50.97",
          style: FontStyles.blod,
        ),
      ],
    );
  }
}
