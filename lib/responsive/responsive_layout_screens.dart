import 'package:flutter/material.dart';
import 'package:instagram_flutter_clone/utils/constants.dart';

class ResponsiveLayoutScreens extends StatelessWidget {
  final Widget desktopLayout;
  final Widget mobileLayout;
  final Widget tabletLayout;

  const ResponsiveLayoutScreens({
    Key? key,
    required this.desktopLayout,
    required this.mobileLayout,
    required this.tabletLayout,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > desktopScreenSize) {
          return desktopLayout;
        } else if (constraints.maxWidth > tabletScreenSize &&
            constraints.maxWidth < desktopScreenSize) {
          return tabletLayout;
        } else {
          return mobileLayout;
        }
      },
    );
  }
}
