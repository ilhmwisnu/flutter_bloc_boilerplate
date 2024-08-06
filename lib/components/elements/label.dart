import 'package:flutter/material.dart';

class FormLabel extends StatelessWidget {
  const FormLabel({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [Text(text), SizedBox(height: 4)],
    );
  }
}
