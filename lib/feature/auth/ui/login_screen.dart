import 'package:flutter/material.dart';

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
                TextFormField(
                  validator: emptyValidator,
                  maxLines: 1,
                  controller: controllerLogin,
                  decoration: const InputDecoration(
                      labelText: "Login", border: OutlineInputBorder()),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  validator: emptyValidator,
                  maxLines: 1,
                  controller: controllerPassword,
                  decoration: const InputDecoration(
                      labelText: "Password", border: OutlineInputBorder()),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState?.validate() == true) {
                        print("OK");
                      }
                    },
                    style: ButtonStyle(
                        fixedSize: MaterialStateProperty.all<Size>(
                            const Size(double.maxFinite, 40))),
                    child: const Text("SignIn")),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String? emptyValidator(String? text) {
    if (text?.isEmpty == true) {
      return "Field is empty";
    }
    return null;
  }
}
