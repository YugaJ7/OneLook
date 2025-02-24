import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:onelook/components/button.dart';
import 'package:onelook/components/elevated_button.dart';
import 'package:onelook/components/text.dart';
import 'package:onelook/constants/app_color.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _logoAnimation;
  late Animation<double> _textOpacity;
  bool _showText = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2), 
      vsync: this,
    );

    _logoAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: Offset(0, -0.1),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _textOpacity = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ));

    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _showText = true;
      });
      _controller.forward();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SlideTransition(
                    position: _logoAnimation,
                    child: SvgPicture.asset(
                      'assets/logo.svg',
                      height: 150,
                      width: 150,
                    ),
                  ),
                  if (_showText)
                    FadeTransition(
                      opacity: _textOpacity,
                      child: Column(
                        children: [
                          Text('Welcome to', style: TextStyles.withColor(textcolor: AppColors.deepblue).headline1),
                          Text('OneLook', style: TextStyles.withColor(textcolor: AppColors.deepblue).headline1),
                          SizedBox(height: 20),
                          Text('Just take a look and take action!',
                              style: TextStyles.withColor(textcolor: AppColors.coldgrey).bodytext1),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
          if (_showText)
            FadeTransition(
              opacity: _textOpacity,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 40.0,left: 24.0,right: 24.0),
                child: Center(
                    child: SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: CustomElevatedButton(
                        text: 'Let\'s Start',
                        buttonStyle: ButtonStyles.primary,
                        textStyle: TextStyles.buttontext1,
                        onPressed: () {},
                      ),
                    )
                  ),
              ),
            ),
        ],
      ),
    );
  }
}
