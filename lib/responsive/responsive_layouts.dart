import 'package:flutter/material.dart';
import 'package:instagram_flutter_clone/providers/user_providers.dart';
import 'package:instagram_flutter_clone/utils/constants.dart';
import 'package:provider/provider.dart';

class ResponsiveLayoutScreens extends StatefulWidget {
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
  State<ResponsiveLayoutScreens> createState() =>
      _ResponsiveLayoutScreensState();
}

class _ResponsiveLayoutScreensState extends State<ResponsiveLayoutScreens> {
  @override
  void initState() {
    super.initState();
    _addData();
  }

  _addData() async {
    UserProvider _userProvider = Provider.of(context, listen: false);
    await _userProvider.refreshUser();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > desktopScreenSize) {
          return widget.webLayout;
        } else if (constraints.maxWidth > tabletScreenSize &&
            constraints.maxWidth < desktopScreenSize) {
          return widget.tabletLayout ?? widget.webLayout;
        } else {
          return widget.mobileLayout;
        }
      },
    );
  }
}
