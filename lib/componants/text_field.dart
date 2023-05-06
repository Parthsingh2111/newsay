import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.lableText,
    required this.hintText,
    required this.controller,
    required this.icon,
  });
  final String lableText;
  final String hintText;
  final IconData icon;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: (icon == Icons.lock) ? true : false,
      // obscureText: true,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        labelStyle: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),
        suffixIcon: Icon(
          icon,
          size: 30,
          color: const Color.fromARGB(255, 214, 1, 1),
        ),
      ),
    );
  }
}
