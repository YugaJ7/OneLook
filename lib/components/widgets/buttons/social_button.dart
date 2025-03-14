import 'package:flutter/material.dart';

import '../../../constants/app_color.dart';

class SocialButton extends StatelessWidget {
  final String assetPath;
  const SocialButton({super.key, required this.assetPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: AppColors.lightgrey),
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),
      child: Center(
        child: Image.asset(assetPath, width: 30, height: 30),
      ),
    );
  }
}
