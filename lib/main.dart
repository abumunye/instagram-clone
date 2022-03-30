import 'package:flutter/material.dart';
import 'package:instagram_flutter_clone/responsive/desktop_layout.dart';
import 'package:instagram_flutter_clone/responsive/mobile_layout.dart';
import 'package:instagram_flutter_clone/responsive/responsive_layout_screens.dart';
import 'package:instagram_flutter_clone/responsive/tablet_layout.dart';
import 'package:instagram_flutter_clone/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Instagram Clone",
      theme: ThemeData.dark()
          .copyWith(scaffoldBackgroundColor: mobileBackgroundColor),
      home: ResponsiveLayoutScreens(
        mobileLayout: MobileLayout(),
        webLayout: WebLayout(),
      ),
    );
  }
}
