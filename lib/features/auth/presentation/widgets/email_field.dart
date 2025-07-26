import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  final TextEditingController controller;

  const EmailField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: const InputDecoration(
        labelText: "Email",
        prefixIcon: Icon(Icons.email),
        border: OutlineInputBorder(),
      ),
      validator: (value) =>
      value == null || value.isEmpty ? "Enter your email" : null,
    );
  }
}
