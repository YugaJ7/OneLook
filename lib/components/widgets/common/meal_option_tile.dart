import 'package:flutter/material.dart';
import 'package:onelook/components/style/text.dart';
import 'package:onelook/constants/app_color.dart';

class MealOptionTile extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const MealOptionTile({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.lilacPetalsDark,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: selected ? AppColors.purplePlum : AppColors.lilacPetalsDark,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Text(
          label,
          style: TextStyles.buttontext2.copyWith(
            color: selected ? AppColors.deepBlue : AppColors.darkGrey,
          ),
        ),
      ),
    );
  }
}
