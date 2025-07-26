import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:reco_app/features/auth/data/datasource.dart';
import 'package:reco_app/features/auth/data/repo.dart';
import 'package:reco_app/features/auth/domain/usecases/usecase.dart';
import 'package:reco_app/features/auth/presentation/widgets/password_field.dart';
import 'package:reco_app/routes.dart';
import 'email_field.dart';
import 'login_button.dart';


class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late SignInUseCase signInUseCase;

  @override
  void initState() {
    final dataSource = FirebaseAuthDataSource(FirebaseAuth.instance);
    final repository = AuthRepositoryImpl(dataSource);
    signInUseCase = SignInUseCase(repository);
    super.initState();
  }

  void _login() async {
    if (_formKey.currentState!.validate()) {
      try {
        final user = await signInUseCase(
          _emailController.text.trim(),
          _passwordController.text.trim(),
        );

        if (user != null) {
          Navigator.pushReplacementNamed(context, AppRoutes.menu);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Unknown error occurred")),
          );
        }
      } on FirebaseAuthException catch (e) {
        String errorMsg;
        switch (e.code) {
          case 'user-not-found':
            errorMsg = 'No user found for that email.';
            break;
          case 'wrong-password':
            errorMsg = 'Incorrect password.';
            break;
          case 'invalid-email':
            errorMsg = 'The email address is badly formatted.';
            break;
          case 'user-disabled':
            errorMsg = 'This user has been disabled.';
            break;
          case 'network-request-failed':
            errorMsg = 'Network error. Please check your connection.';
            break;
          default:
            errorMsg = 'email or password is incorrect.';
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMsg)),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Authentication failed : ${e.toString()}")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          EmailField(controller: _emailController),
          const SizedBox(height: 16),
          PasswordField(controller: _passwordController),
          const SizedBox(height: 24),
          LoginButton(onPressed: _login),
        ],
      ),
    );
  }
}
