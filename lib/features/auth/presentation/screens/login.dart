import 'package:flutter/material.dart';
import 'package:reco_app/features/auth/presentation/widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Welcome Back 👋", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Text("Login to your account", style: TextStyle(fontSize: 16, color: Colors.grey[700])),
              const SizedBox(height: 40),
              const LoginForm(),
            ],
          ),
        ),
      ),
    );
  }
}
