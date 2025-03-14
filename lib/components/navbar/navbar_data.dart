import 'package:flutter/material.dart';
import 'package:onelook/screens/activity.dart';
import 'package:onelook/screens/home.dart';
import 'package:onelook/screens/progress.dart';
import 'package:onelook/screens/setting.dart';

class NavbarData {
  // List of screens
  static final List<Widget> screens = [
    const HomeScreen(),
    const ActivityScreen(),
    const ProgressScreen(),
    const SettingScreen(),
  ];

  // List of icons
  static final List<String> icons = [
    'assets/navbar/home.png',
    'assets/navbar/activity.png',
    'assets/navbar/progress.png',
    'assets/navbar/settings.png',
  ];

  // List of filled icons
  static final List<String> filledIcons = [
    'assets/navbar/homefill.png',
    'assets/navbar/activityfill.png',
    'assets/navbar/progressfill.png',
    'assets/navbar/settingsfill.png',
  ];
}