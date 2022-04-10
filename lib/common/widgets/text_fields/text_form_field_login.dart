import 'package:flutter/material.dart';

class TextFormFieldLogin extends StatelessWidget {
  String label;
  TextEditingController controller;
  Widget? prefixIcon;
  double radius;
  String? Function(String?) validator;
  bool isSecure;

  TextFormFieldLogin(
      {required this.label,
      required this.controller,
      required this.validator,
      this.prefixIcon,
      this.isSecure = false,
      this.radius = 0});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0, top: 8.0),
      child: TextFormField(
        obscureText: isSecure,
        controller: controller,
        decoration: InputDecoration(
          label: Text(label),
          prefixIcon: prefixIcon,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        validator: validator,
      ),
    );
  }
}
