import 'package:flutter/material.dart';
import 'package:onelook/components/style/text.dart';
import 'package:onelook/constants/app_color.dart';

class StatsCard extends StatelessWidget {
  final String title;
  final String rate;
  final VoidCallback? onPressed;
  final String icon;
  final Color? color;

  const StatsCard({
    super.key,
    required this.title,
    required this.rate,
    required this.onPressed,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          width: screenWidth * 0.31,
          height: screenHeight * 0.18,
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    icon,
                    width: screenWidth * 0.11,
                    height: screenHeight * 0.05,
                  ),
                  Image.asset(
                    'assets/arrowright.png',
                    width: screenWidth * 0.06,
                    height: screenHeight * 0.026,
                    color: AppColors.deepBlue,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: TextStyles.withColor(textcolor: AppColors.coldGrey)
                          .bodytext3),
                  SizedBox(height: 4),
                  Text(
                    rate,
                    style: TextStyles.withColor(textcolor: AppColors.deepBlue)
                        .bodytext3
                        .copyWith(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                            height: 1.2,
                            letterSpacing: 0),
                  ),
                  SizedBox(height: 8),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
