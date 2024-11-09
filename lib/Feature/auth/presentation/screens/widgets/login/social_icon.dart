import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialIcon extends StatelessWidget {
  const SocialIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            onPressed: () {},
            icon: const FaIcon(
              FontAwesomeIcons.facebook,
              color: Color(0xFF2136F3),
              size: 30,
            )),
        const SizedBox(
          width: 8,
        ),
        IconButton(
          onPressed: () {},
          icon: const FaIcon(
            FontAwesomeIcons.google,
            color: Colors.red,
            size: 30,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        IconButton(
          onPressed: () {},
          icon: const FaIcon(
            FontAwesomeIcons.twitter,
            color: Colors.blue,
            size: 30,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
      ],
    );
  }
}
