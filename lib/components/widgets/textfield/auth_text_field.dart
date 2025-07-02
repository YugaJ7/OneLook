import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/app_color.dart';
import '../../style/text.dart';

class AuthTextField extends StatelessWidget {
  final String label, hint, icon;
  final TextEditingController controller;
  final RxBool obscureText; // Use RxBool for reactive obscureText
  final VoidCallback? toggleObscureText;

  const AuthTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.icon,
    required this.controller,
    required this.obscureText, // Pass the RxBool
    this.toggleObscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyles.withColor(textcolor: AppColors.darkGrey).bodytext2,
        ),
        SizedBox(height: 4),
        Obx(() {
          return TextField(
            controller: controller,
            obscureText: obscureText.value, // Observe obscureText.value
            style:
                TextStyles.withColor(textcolor: AppColors.darkGrey).bodytext2,
            cursorColor: AppColors.darkGrey,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle:
                  TextStyles.withColor(textcolor: AppColors.darkGrey).bodytext2,
              prefixIcon: Image.asset(icon, scale: 3),
              suffixIcon: toggleObscureText != null
                  ? IconButton(
                      icon: Icon(
                        obscureText.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: toggleObscureText,
                      color: AppColors.darkGrey,
                    )
                  : null,
              focusColor: AppColors.lilacPetals,
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.lilacPetalsDark),
                borderRadius: BorderRadius.circular(14),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.lilacPetalsDark),
                borderRadius: BorderRadius.circular(14),
              ),
              fillColor: AppColors.lilacPetals,
              filled: true,
            ),
          );
        }),
      ],
    );
  }
}
