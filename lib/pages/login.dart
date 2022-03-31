import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_flutter_clone/utils/colors.dart';

import '../widgets/text_input.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
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
                // instagram text title
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
                  hint: "username",
                  controller: _usernameController,
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
                      onTap: () => debugPrint("Log in"),
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
                    onTap: () => debugPrint("Sign up"),
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
