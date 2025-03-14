import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:onelook/components/style/button.dart';
import 'package:onelook/components/widgets/buttons/elevated_button.dart';
import 'package:onelook/components/style/text.dart';
import 'package:onelook/constants/app_color.dart';
import 'package:onelook/controllers/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  final SplashController controller = Get.find();

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
                    position: controller.logoAnimation,
                    child: SvgPicture.asset(
                      'assets/logo.svg',
                      height: 150,
                      width: 150,
                    ),
                  ),
                  Obx(() => controller.showText.value
                      ? FadeTransition(
                          opacity: controller.textOpacity,
                          child: Column(
                            children: [
                              Text('Welcome to',
                                  style: TextStyles.withColor(
                                          textcolor: AppColors.deepblue)
                                      .headline1),
                              Text('OneLook',
                                  style: TextStyles.withColor(
                                          textcolor: AppColors.deepblue)
                                      .headline1),
                              SizedBox(height: 20),
                              Text('Just take a look and take action!',
                                  style: TextStyles.withColor(
                                          textcolor: AppColors.coldgrey)
                                      .bodytext1),
                            ],
                          ),
                        )
                      : SizedBox.shrink()),
                ],
              ),
            ),
          ),
          Obx(() => controller.showText.value
              ? FadeTransition(
                  opacity: controller.textOpacity,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        bottom: 40.0, left: 24.0, right: 24.0),
                    child: Center(
                      child: SizedBox(
                        height: 60,
                        width: double.infinity,
                        child: CustomElevatedButton(
                          text: 'Let\'s Start',
                          buttonStyle: ButtonStyles.buttonprimary,
                          textStyle: TextStyles.buttontext1,
                          onPressed: () {
                            Get.offNamed('/onboarding');
                          },
                        ),
                      ),
                    ),
                  ),
                )
              : SizedBox.shrink()),
        ],
      ),
    );
  }
}
