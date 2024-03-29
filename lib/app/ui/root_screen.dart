import 'package:client_it/app/ui/app_loader.dart';
import 'package:client_it/feature/auth/ui/components/auth_builder.dart';
import 'package:client_it/feature/auth/ui/sign_in_screen.dart';
import 'package:client_it/feature/main/ui/main_screen.dart';
import 'package:flutter/material.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthBuilder(
      isNotAuthorized: (context) => SignInScreen(),
      isWaiting: (context) => const AppLoader(),
      isAuthorized: (context, value, child) => MainScreen(userEntity: value),
    );
  }
}
