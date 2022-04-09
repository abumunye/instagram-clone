import "package:flutter/material.dart";
import 'package:instagram_flutter_clone/services/auth_service.dart';
import 'package:instagram_flutter_clone/utils/colors.dart';
import 'package:instagram_flutter_clone/utils/utils.dart';

import '../widgets/text_input.dart';
import 'signup.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _passwordController.dispose();
    _emailController.dispose();
  }

  void _logInUser() async {
    String res = await AuthService.logInUser(
      email: _emailController.text,
      password: _passwordController.text,
    );
    if (res == "success") {
    } else {
      showSnackbar(res, context);
    }
  }

  void _navigateToSignUp() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SignUp(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 100),
                const Text(
                  "Instagram",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
                const SizedBox(height: 100),
                TextInput(
                  hint: "email",
                  controller: _emailController,
                  textInputType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 24),
                TextInput(
                  hint: "password",
                  isPass: true,
                  controller: _passwordController,
                  textInputType: TextInputType.visiblePassword,
                ),
                const SizedBox(height: 24),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: _logInUser,
                      child: Container(
                        child: const Text("Log in"),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(12),
                        // give this container a rounded border
                        decoration: ShapeDecoration(
                          color: blueColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                      child: GestureDetector(
                    onTap: () => _navigateToSignUp(),
                    child: Container(
                      child: const Text("Sign up"),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(12),
                      // give this container a rounded border
                      decoration: ShapeDecoration(
                        color: blueColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  )),
                ])
              ],
            )),
      ),
    );
  }
}
