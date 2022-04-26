import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {

  final String? hint;
  final TextEditingController? controller;
  final FormFieldValidator? validator;

  const CustomTextField({Key? key, this.hint, this.controller, this.validator}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        hintText: hint
      ),
    );
  }
}
