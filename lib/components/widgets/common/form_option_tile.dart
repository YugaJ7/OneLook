import 'package:flutter/material.dart';
import 'package:onelook/components/style/text.dart';
import 'package:onelook/constants/app_color.dart';

class FormOptionTile extends StatelessWidget {
  final String icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const FormOptionTile({
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
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: AppColors.lilacPetalsDark,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: selected ? AppColors.purplePlum : AppColors.lilacPetalsDark,
              ),
            ),
            child: Center(
              child: Image.asset(
                'assets/icons/$icon.png',
                width: 32,
                height: 32,
                color: selected ? AppColors.deepBlue : AppColors.darkGrey,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: TextStyles.buttontext2.copyWith(
              color: selected ? AppColors.deepBlue : AppColors.darkGrey,
            ),
          ),
        ],
      ),
    );
  }
}
