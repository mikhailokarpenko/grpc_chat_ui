import 'package:client_it/app/ui/components/app_text_button.dart';
import 'package:client_it/app/ui/components/app_text_field.dart';
import 'package:client_it/feature/auth/domain/auth_state/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  final controllerLogin = TextEditingController();
  final controllerPassword = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("LoginScreen"),
      ),
      body: Form(
        key: formKey,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                AppTextField(controller: controllerLogin, labelText: "Login"),
                const SizedBox(height: 16),
                AppTextField(
                    controller: controllerPassword,
                    labelText: "Password",
                    obscureText: true),
                const SizedBox(height: 16),
                AppTextButton(
                  onPressed: () {
                    if (formKey.currentState?.validate() == true) {
                      _onSignInPressed(context.read<AuthCubit>());
                    }
                  },
                  text: 'Sign In',
                ),
                const SizedBox(height: 16),
                AppTextButton(
                  backgroundColor: Colors.blueGrey,
                  onPressed: () {
                    if (formKey.currentState?.validate() == true) {
                      print("OK");
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

  void _onSignInPressed(AuthCubit authCubit) => authCubit.signIn(
      email: controllerLogin.text, password: controllerPassword.text);
}
