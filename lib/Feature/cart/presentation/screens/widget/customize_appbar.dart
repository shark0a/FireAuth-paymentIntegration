import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

AppBar customizeAppBar(BuildContext context, String title) {
  return AppBar(
    leading: Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Center(
        child: GestureDetector(
          onTap: () => GoRouter.of(context).pop(),
          child: const FaIcon(
            FontAwesomeIcons.arrowLeftLong,
            size: 35,
          ),
        ),
      ),
    ),
    title: Text(title),
    centerTitle: true,
  );
}
