import 'package:client_it/app/ui/components/app_text_button.dart';
import 'package:client_it/app/ui/components/app_text_field.dart';
import 'package:client_it/feature/auth/domain/auth_state/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatelessWidget {
  final controllerUsername = TextEditingController();
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  final controllerPassword2 = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SignUpScreen"),
      ),
      body: Form(
        key: formKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppTextField(
                    controller: controllerUsername, labelText: "Username"),
                const SizedBox(height: 16),
                AppTextField(controller: controllerEmail, labelText: "Email"),
                const SizedBox(height: 16),
                AppTextField(
                    controller: controllerPassword,
                    labelText: "Password",
                    obscureText: true),
                const SizedBox(height: 16),
                AppTextField(
                    controller: controllerPassword2,
                    labelText: "Confirm Password",
                    obscureText: true),
                const SizedBox(height: 16),
                AppTextButton(
                  backgroundColor: Colors.blueGrey,
                  onPressed: () {
                    if (formKey.currentState?.validate() != true) return;
                    if (controllerPassword2.text != controllerPassword.text) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Passwords not equal")));
                    } else {
                      _onSignUpPressed(context.read<AuthCubit>());
                      Navigator.of(context).pop();
                    }
                  },
                  text: 'Sign Up',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onSignUpPressed(AuthCubit authCubit) => authCubit.signUp(
      email: controllerEmail.text,
      username: controllerUsername.text,
      password: controllerPassword.text);
}
