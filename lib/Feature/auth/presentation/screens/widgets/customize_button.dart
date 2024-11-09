import 'package:authtest/core/styles/fonts/font_colors.dart';
import 'package:flutter/material.dart';

class CustomizeButton extends StatelessWidget {
  const CustomizeButton({
    super.key,
    required this.ontap,
    required this.title,
  });
  final String title;
  final void Function() ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 50,
        margin: const EdgeInsets.only(left: 20, right: 20),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: FontColors.primaryColor,
        ),
        child: Text(
          title,
          style: const TextStyle(
              color: Colors.white, fontSize: 20, fontFamily: 'Poppins'),
        ),
      ),
    );
  }
}
