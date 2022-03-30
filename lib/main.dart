import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter_clone/responsive/desktop_layout.dart';
import 'package:instagram_flutter_clone/responsive/mobile_layout.dart';
import 'package:instagram_flutter_clone/responsive/responsive_layout_screens.dart';
import 'package:instagram_flutter_clone/responsive/tablet_layout.dart';
import 'package:instagram_flutter_clone/utils/colors.dart';

void main() async {
  // check if using web
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    // firebase Options
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: '', appId: '', messagingSenderId: '', projectId: ''));
  } else {
    await Firebase.initializeApp();
  }
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
