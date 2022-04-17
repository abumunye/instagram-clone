import 'package:flutter/material.dart';

import '../pages/add_post_screen.dart';

const tabletScreenSize = 800;
const desktopScreenSize = 1200;

const homeScreenItems = <Widget>[
  Text("home"),
  Text("search"),
  AddPostScreen(),
  Text("notifications"),
];
