import 'package:flutter/material.dart';
import 'package:instagram_flutter_clone/services/auth_service.dart';
import 'package:instagram_flutter_clone/utils/colors.dart';

import '../pages/login.dart';
import '../utils/utils.dart';

class MobileLayout extends StatefulWidget {
  const MobileLayout({Key? key}) : super(key: key);

  @override
  State<MobileLayout> createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> {
  int _currentIndex = 0;

  _onTappedIcon(int index) {
    if (index == 3) {
      _logOutUser();
    }
    setState(() {
      _currentIndex = index;
    });
  }

  _logOutUser() async {
    var res = await AuthService.logOutUser();
    if (res == "success") {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => Login()));
    } else {
      debugPrint(res);
      showSnackbar(res, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("sdasd")),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: mobileBackgroundColor,
          currentIndex: _currentIndex,
          // selectedItemColor: primaryColor,
          onTap: _onTappedIcon,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              backgroundColor: primaryColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: "Search",
              backgroundColor: primaryColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
              backgroundColor: primaryColor,
            ),
            // log out bottom navigation bar item
            BottomNavigationBarItem(
              icon: Icon(Icons.exit_to_app),
              label: "Log Out",
              backgroundColor: primaryColor,
            ),
          ]),
    );
  }
}
