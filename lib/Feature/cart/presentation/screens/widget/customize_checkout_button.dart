import 'package:authtest/core/styles/font_styles.dart';
import 'package:flutter/material.dart';

class CustomizeCheckoutButton extends StatelessWidget {
  const CustomizeCheckoutButton({
    super.key,
    required this.title,
    this.onTap,
    required this.width,
    required this.background,
    required this.hight,
    this.style,
  });
  final String title;
  final double width;
  final double hight;
  final Function()? onTap;
  final Color background;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: hight,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: background,
            border:
                const Border.fromBorderSide(BorderSide(color: Color(0xff34A853)))),
        child: Center(
          child: Text(
            title,
            style: style ?? FontStyles.titlestyle.copyWith(
                    fontSize: 22,
                    color: Colors.black,
                  ),
          ),
        ),
      ),
    );
  }
}
