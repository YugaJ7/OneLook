import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/app_color.dart';
import '../text.dart';

class AuthTextField extends StatelessWidget {
  final String label, hint, icon;
  final TextEditingController controller;
  final RxBool obscureText; 
  final VoidCallback? toggleObscureText;

  const AuthTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.icon,
    required this.controller,
    required this.obscureText, 
    this.toggleObscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyles.withColor(textcolor: AppColors.darkgrey).bodytext2,
        ),
        SizedBox(height: 4),
        TextField(
          controller: controller,
          obscureText: obscureText.value, 
          style: TextStyles.withColor(textcolor: AppColors.darkgrey).bodytext2,
          cursorColor: AppColors.darkgrey,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyles.withColor(textcolor: AppColors.darkgrey).bodytext2,
            prefixIcon: Image.asset(icon, scale: 3),
            suffixIcon: toggleObscureText != null
                ? Obx(() => IconButton(
                    icon: Icon(obscureText.value ? Icons.visibility_off : Icons.visibility),
                    onPressed: toggleObscureText,
                    color: AppColors.darkgrey,
                  ))
                : null,
            focusColor: AppColors.lilac,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.lilacdark),
              borderRadius: BorderRadius.circular(14),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.lilacdark),
              borderRadius: BorderRadius.circular(14),
            ),
            fillColor: AppColors.lilac,
            filled: true,
          ),
        ),
      ],
    );
  }
}