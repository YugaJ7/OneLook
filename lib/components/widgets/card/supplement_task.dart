import 'package:flutter/material.dart';
import 'package:onelook/components/style/text.dart';
import 'package:onelook/constants/app_color.dart';

class SupplementTaskCard extends StatelessWidget {
  final String icon;
  final String title;
  final String subtitle;
  final bool isChecked;
  final VoidCallback onChecked;

  const SupplementTaskCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.isChecked,
    required this.onChecked,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: AppColors.purplePlum.withAlpha(5),
            blurRadius: 10,
            //offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset('assets/icons/$icon.png', width: 32, height: 32, color: AppColors.violet,),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: TextStyles.withColor(textcolor: AppColors.deepBlue)
                        .headline3),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TextStyles.withColor(textcolor: AppColors.darkGrey)
                      .bodytext3,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          //const Spacer(),
          GestureDetector(
            onTap: onChecked,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(width: 1.5, color: AppColors.dustGrey),
              ),
              child: CircleAvatar(
                radius: 12,
                backgroundColor:
                    isChecked ? AppColors.turquoise : AppColors.lilacPetalsDark,
                child: isChecked
                    ? const Icon(Icons.check, size: 16, color: Colors.white)
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
