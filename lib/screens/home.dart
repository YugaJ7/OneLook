import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onelook/components/text.dart';
import 'package:onelook/constants/app_color.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lilac,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset('assets/logosmall.svg'),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(child: SvgPicture.asset('assets/notification.svg'),),
                  )
                ],
              ),
              SizedBox(height: 20),
              Text('Hi Yuga!', style: TextStyles.withColor(textcolor: AppColors.deepblue).headline1),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Health Stats', style: TextStyles.withColor(textcolor: AppColors.deepblue).headline1),
                ],
              ),
            ]
            ),
        ),
      )
    );
  }
}