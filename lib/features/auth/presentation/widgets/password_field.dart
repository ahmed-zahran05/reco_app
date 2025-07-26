import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  final TextEditingController controller;

  const PasswordField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: true,
      decoration: const InputDecoration(
        labelText: "Password",
        prefixIcon: Icon(Icons.lock),
        border: OutlineInputBorder(),
      ),
      validator: (value) =>
      value == null || value.length < 6 ? "Password must be at least 6 characters" : null,
    );
  }
}
