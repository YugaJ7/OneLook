import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:onelook/components/style/button.dart';
import 'package:onelook/components/widgets/buttons/smalloutlinedbutton.dart';
import 'package:onelook/constants/app_color.dart';
import 'package:onelook/controllers/onboarding_controller.dart';
import 'package:onelook/components/style/text.dart';

class OnboardingScreen extends StatelessWidget {
  final OnboardingController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightvoilet,
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.8,
                child: PageView.builder(
                  controller: controller.pageController,
                  onPageChanged: controller.setCurrentPage,
                  itemCount: controller.pages.length,
                  itemBuilder: (_, index) => OnboardingPage(
                    image: controller.pages[index]['image'] ?? '',
                    title: controller.pages[index]['title'] ?? '',
                    description: controller.pages[index]['description'] ?? '',
                  ),
                ),
              ),
              SizedBox(
                height: 88,
                width: 88,
                child: ElevatedButton(
                  onPressed: controller.nextPage,
                  child: Image.asset('assets/arrowright.png',
                      width: 40, height: 40),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    padding: EdgeInsets.all(20),
                    backgroundColor: AppColors.purpleplum,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Obx(() => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        controller.pages.length,
                        (index) => Container(
                          margin: EdgeInsets.symmetric(horizontal: 8.0),
                          width: 60.0,
                          height: 4.0,
                          decoration: BoxDecoration(
                            color: index <= controller.currentPage.value
                                ? AppColors.purpleplum
                                : AppColors.lilacdark,
                            borderRadius: BorderRadius.circular(2.0),
                          ),
                        ),
                      ),
                    )),
              ),
            ],
          ),
          Positioned(
            top: 40,
            right: 20,
            child: SmallOutlinedButton(
              text: 'Skip Intro',
              onPressed: () => Get.offNamed('/login'),
              textStyle: TextStyles.buttontext2,
              buttonStyle: ButtonStyles.smallprimary,
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const OnboardingPage({
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(image),
          SizedBox(height: 40),
          Text(
            title,
            style:
                TextStyles.withColor(textcolor: AppColors.deepblue).headline1,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Text(
            description,
            style:
                TextStyles.withColor(textcolor: AppColors.coldgrey).bodytext1,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}