import 'package:flutter/material.dart';
import 'package:instagram_flutter_clone/services/auth_service.dart';
import 'package:instagram_flutter_clone/utils/colors.dart';
import 'package:instagram_flutter_clone/utils/constants.dart';
import 'package:provider/provider.dart';

import '../pages/login.dart';
import '../providers/user_providers.dart';
import '../utils/utils.dart';

class MobileLayout extends StatefulWidget {
  const MobileLayout({Key? key}) : super(key: key);

  @override
  State<MobileLayout> createState() => _MobileLayoutState();
}

class _MobileLayoutState extends State<MobileLayout> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _onTappedIcon(int page) {
    if (page == 4) {
      _logOutUser();
    }
    _pageController.jumpToPage(page);
  }

  _logOutUser() async {
    var res = await AuthService.logOutUser();
    if (res == "success") {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => Login()));
    } else {
      showSnackbar(res, context);
    }
  }

  _onPageChanged(int page) {
    setState(() {
      _currentIndex = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<UserProvider>(context, listen: false).getUser;
    return Scaffold(
      body: Center(
          child: PageView(
        children: [...homeScreenItems],
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: _onPageChanged,
      )),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: mobileBackgroundColor,
          currentIndex: _currentIndex,
          selectedItemColor: primaryColor,
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
              icon: Icon(Icons.add_circle),
              label: "Photo",
              backgroundColor: primaryColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
              backgroundColor: primaryColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.exit_to_app),
              label: "Log Out",
              backgroundColor: primaryColor,
            ),
          ]),
    );
  }
}
