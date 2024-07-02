import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controllerValue;
  final bool isPassword;
  final double height;
  final double width;
  final TextInputType inputType;

  CustomTextField({
    required this.label,
    required this.controllerValue,
    this.isPassword = false,
    this.height = 60.0, // Default height
    this.width = double.infinity, // Default width
    this.inputType = TextInputType.text, // Default input type
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: TextFormField(
        controller: controllerValue,
        obscureText: isPassword,
        keyboardType: inputType,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
