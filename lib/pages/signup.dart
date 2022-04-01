import "package:flutter/material.dart";
import 'package:instagram_flutter_clone/utils/colors.dart';

import '../widgets/text_input.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _bioController = TextEditingController();

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
                const Text(
                  "Instagram",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 64,
                      // backgroundColor: Colors.grey,
                      backgroundImage: NetworkImage(
                          "https://images.unsplash.com/photo-1604311359386-efa1bbcf3353?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80"),
                    ),
                    Positioned(
                        bottom: -10,
                        right: 10,
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.add_a_photo)))
                  ],
                ),
                const SizedBox(height: 100),
                TextInput(
                  hint: "Enter your username",
                  controller: _usernameController,
                  textInputType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 24),
                TextInput(
                  hint: "Enter your email",
                  controller: _emailController,
                  textInputType: TextInputType.visiblePassword,
                ),
                const SizedBox(height: 24),
                TextInput(
                  hint: "Enter your password",
                  isPass: true,
                  controller: _passwordController,
                  textInputType: TextInputType.visiblePassword,
                ),
                const SizedBox(height: 24),
                TextInput(
                  hint: "Enter your bio",
                  controller: _bioController,
                  textInputType: TextInputType.visiblePassword,
                ),
                const SizedBox(height: 24),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
