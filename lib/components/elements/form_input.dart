import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FormInput extends StatelessWidget {
  const FormInput({super.key, required this.name, this.initialValue, this.isObscureText = false, this.validator, this.decoration = const InputDecoration()});

  final String name;
  final String? initialValue;
  final bool isObscureText;
  final String? Function(String?)? validator;
  final InputDecoration decoration;

  @override
  Widget build(BuildContext context) {
    return FormBuilderTextField(
      name: name,
      initialValue: initialValue,
      obscureText: isObscureText,
      validator: validator,
      decoration: decoration ,
    );
  }
}
