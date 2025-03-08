import 'package:flutter/material.dart';
import 'package:onelook/constants/app_color.dart';
import 'package:onelook/screens/activity.dart';
import 'package:onelook/screens/progress.dart';
import 'package:onelook/screens/setting.dart';

import '../screens/home.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectedIndex = 0;
  double _circlePosition = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const ActivityScreen(),
    const ProgressScreen(),
    const SettingScreen(),
  ];

  final List<String> _icons = [
    'assets/navbar/home.png',
    'assets/navbar/activity.png',
    'assets/navbar/progress.png',
    'assets/navbar/settings.png',
  ];
  final List<String> _filledicons = [
    'assets/navbar/homefill.png',
    'assets/navbar/activityfill.png',
    'assets/navbar/progressfill.png',
    'assets/navbar/settingsfill.png',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final iconContainerWidth = screenWidth / _icons.length;
    _circlePosition = (_selectedIndex * iconContainerWidth) + (iconContainerWidth / 2) - 25;

    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(237, 238, 251, 0.8),
              blurRadius: 40,
              spreadRadius: 2,
              offset: Offset(0, -5),
            ),
          ],
        ),
        height: 80,
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              left: _circlePosition,
              top: 5,
              child: CircleAvatar(
                radius: 25,
                backgroundColor: AppColors.lightvoilet,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(_icons.length, (index) {
                return GestureDetector(
                  onTap: () => _onItemTapped(index),
                  child: Container(
                    width: iconContainerWidth,
                    height: 80,
                    alignment: Alignment.center,
                    child: Image.asset(
                      _selectedIndex != index ? _icons[index] : _filledicons[index],
                      scale: 3.5,
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}