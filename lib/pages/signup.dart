import 'dart:typed_data';

import "package:flutter/material.dart";
import 'package:image_picker/image_picker.dart';
import 'package:instagram_flutter_clone/responsive/responsive_layouts.dart';
import 'package:instagram_flutter_clone/services/auth_service.dart';
import 'package:instagram_flutter_clone/utils/colors.dart';

import '../responsive/mobile_layout.dart';
import '../responsive/web_layout.dart';
import '../utils/utils.dart';
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
  Uint8List? _image;
  bool _isLoading = false;
  @override
  void dispose() {
    super.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    _emailController.dispose();
    _bioController.dispose();
  }

  void _selectImage() async {
    var image = await pickImage(ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  void _signUpUser() async {
    setState(() => _isLoading = true);
    if (_image == null) {
      showSnackbar("Please select an image", context);
      setState(() => _isLoading = false);
      return;
    }
    final result = await AuthService.signUpUser(
      username: _usernameController.text,
      email: _emailController.text,
      password: _passwordController.text,
      bio: _bioController.text,
      file: _image!,
    );
    if (result != "success") {
      showSnackbar(result, context);
    } else {
      showSnackbar("Successfully created account", context);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) => ResponsiveLayoutScreens(
                webLayout: const WebLayout(),
                mobileLayout: const MobileLayout())),
      );
    }
    setState(() => _isLoading = false);
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
                const SizedBox(height: 50),
                Stack(
                  children: [
                    _image == null
                        ? const CircleAvatar(
                            radius: 64,
                            backgroundImage: NetworkImage(
                                "https://thumbs.dreamstime.com/b/default-avatar-profile-trendy-style-social-media-user-icon-187599373.jpg"),
                          )
                        : CircleAvatar(
                            radius: 64,
                            backgroundImage:
                                MemoryImage(_image ?? Uint8List(0)),
                          ),
                    Positioned(
                        bottom: -10,
                        right: 10,
                        child: IconButton(
                            onPressed: () {
                              _selectImage();
                            },
                            icon: const Icon(Icons.add_a_photo)))
                  ],
                ),
                const SizedBox(height: 60),
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
                    onTap: _signUpUser,
                    child: SizedBox(
                      height: 50,
                      child: Container(
                        child: _isLoading
                            ? const Center(
                                child: CircularProgressIndicator(
                                  color: primaryColor,
                                ),
                              )
                            : const Text("Sign up"),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(12),
                        decoration: ShapeDecoration(
                          color: blueColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                    ),
                  )),
                ]),
              ],
            )),
      ),
    );
  }
}
