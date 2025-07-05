import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onelook/components/style/text.dart';
import 'package:onelook/constants/app_color.dart';

class ReminderToggleRow extends StatelessWidget {
  final String label;
  final RxBool value;

  const ReminderToggleRow({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() => Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label,
                  style: TextStyles.withColor(textcolor: AppColors.deepBlue).headline3),
              GestureDetector(
                onTap: () => value.toggle(),
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 1.5, color: AppColors.dustGrey),
                  ),
                  child: CircleAvatar(
                    radius: 12,
                    backgroundColor: value.value
                        ? AppColors.turquoise
                        : AppColors.lilacPetalsDark,
                    child: value.value
                        ? const Icon(Icons.check, size: 16, color: Colors.white)
                        : null,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
