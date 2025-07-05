import 'package:flutter/material.dart';
import 'package:onelook/components/style/text.dart';
import 'package:onelook/constants/app_color.dart';

class ActivityOptionTile extends StatelessWidget {
  final String icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const ActivityOptionTile({
    super.key,
    required this.icon,
    required this.label,
    this.selected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 66,
            height: 66,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.lilacPetalsDark,
              border: Border.all(
                width: 4,
                color: selected ? AppColors.violet : AppColors.lilacPetalsDark,
              ),
            ),
            child: Center(
              child: Image.asset(
                'assets/icons/$icon.png',
                width: 40,
                height: 40,
                color: selected ? AppColors.coldGrey : AppColors.violet,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyles.withColor(
              textcolor: selected ? AppColors.deepBlue : AppColors.darkGrey,
            ).bodytext3.copyWith(fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
