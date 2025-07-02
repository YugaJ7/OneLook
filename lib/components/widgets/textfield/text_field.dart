import 'package:flutter/material.dart';
import '../../../constants/app_color.dart';
import '../../style/text.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;

  const CustomTextField({
    super.key,
    required this.hint,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: TextStyles.withColor(textcolor: AppColors.deepBlue).bodytext2,
      cursorColor: AppColors.deepBlue,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle:
            TextStyles.withColor(textcolor: AppColors.deepBlue).bodytext2,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.violet),
          borderRadius: BorderRadius.circular(14),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.violet),
          borderRadius: BorderRadius.circular(14),
        ),
        fillColor: AppColors.lilacPetals,
        filled: true,
      ),
    );
  }
}
