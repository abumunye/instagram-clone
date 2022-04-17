import 'package:flutter/material.dart';
import 'package:instagram_flutter_clone/utils/colors.dart';

class MobileLayout extends StatefulWidget {
  const MobileLayout({Key? key}) : super(key: key);

  @override
  State<MobileLayout> createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("sdasd")),
      bottomNavigationBar:
          BottomNavigationBar(backgroundColor: mobileBackgroundColor, items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "",
          backgroundColor: primaryColor,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: "",
          backgroundColor: primaryColor,
        ),
      ]),
    );
  }
}
