import 'package:flutter/material.dart';


class InputWidget extends StatelessWidget {
  final String labelText;
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final IconData? icon;
  final String? Function ( String? ) validacion;
  final void Function(  String ) onChange;


  const InputWidget({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.validacion,
    required this.onChange,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.icon

  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: icon != null ? Icon(icon) : null,
        border: const OutlineInputBorder(),
      ),
      validator:  validacion,
      onChanged: onChange,
    );
  }
}

