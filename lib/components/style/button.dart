import 'package:flutter/material.dart';
import 'package:onelook/constants/app_color.dart';

@immutable
class ButtonStyles {
  static var buttonprimary = ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      backgroundColor: AppColors.purplePlum,
      shadowColor: AppColors.violet,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: AppColors.purplePlum, width: 1)),
      elevation: 5);

  static var smallprimary = OutlinedButton.styleFrom(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
      side: BorderSide(color: AppColors.purplePlum, width: 1),
      elevation: 0);
}
