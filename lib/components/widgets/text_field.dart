import 'package:flutter/material.dart';

import '../../constants/app_color.dart';
import '../text.dart';

class AuthTextField extends StatelessWidget {
  final String label, hint, icon;
  const AuthTextField({super.key, required this.label, required this.hint, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style:
                TextStyles.withColor(textcolor: AppColors.darkgrey).bodytext2),
        SizedBox(height: 4),
        TextField(
          style: TextStyles.withColor(textcolor: AppColors.darkgrey).bodytext2,
          cursorColor: AppColors.darkgrey,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle:
                TextStyles.withColor(textcolor: AppColors.darkgrey).bodytext2,
            prefixIcon: Image.asset(icon, scale: 3),
            focusColor: AppColors.lilac,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.lilacdark),
                borderRadius: BorderRadius.circular(14)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.lilacdark),
                borderRadius: BorderRadius.circular(14)),
            fillColor: AppColors.lilac,
            filled: true,
            border: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.lilacdark),
                borderRadius: BorderRadius.circular(14)),
          ),
        ),
      ],
    );
  }
}
