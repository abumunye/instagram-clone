import 'package:flutter/material.dart';
import 'package:instagram_flutter_clone/utils/constants.dart';

class ResponsiveLayoutScreens extends StatelessWidget {
  final Widget webLayout;
  final Widget mobileLayout;
  Widget? tabletLayout;

  ResponsiveLayoutScreens({
    Key? key,
    required this.webLayout,
    required this.mobileLayout,
    this.tabletLayout,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > desktopScreenSize) {
          return webLayout;
        } else if (constraints.maxWidth > tabletScreenSize &&
            constraints.maxWidth < desktopScreenSize) {
          return tabletLayout ?? webLayout;
        } else {
          return mobileLayout;
        }
      },
    );
  }
}
