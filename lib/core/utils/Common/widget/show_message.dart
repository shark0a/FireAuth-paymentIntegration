import 'package:flutter/material.dart';

class ShowMessage extends StatelessWidget {
  const ShowMessage({super.key, this.message});
  final dynamic message;
  @override
  Widget build(BuildContext context) {
    throw ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}
