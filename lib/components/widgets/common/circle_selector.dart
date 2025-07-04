import 'package:flutter/material.dart';
import 'package:onelook/components/style/text.dart';
import 'package:onelook/constants/app_color.dart';

class CircleSelector extends StatelessWidget {
  final int selectedIndex;
  final void Function(int index) onSelect;

  const CircleSelector({
    super.key,
    required this.selectedIndex,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 52,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (_, index) {
          final selected = index == selectedIndex;
          return GestureDetector(
            onTap: () => onSelect(index),
            child: CircleAvatar(
              radius: 24,
              backgroundColor: AppColors.lilacPetalsDark,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: selected ? AppColors.purplePlum : AppColors.lilacPetalsDark),
                ),
                child: Center(
                  child: Text(
                    "${index + 1}",
                    style: TextStyles.withColor(
                      textcolor: selected ? AppColors.deepBlue : AppColors.darkGrey,
                    ).headline3,
                  ),
                ),
              ),
            ),
          );
        },
        separatorBuilder: (_, __) => const SizedBox(width: 12),
      ),
    );
  }
}
