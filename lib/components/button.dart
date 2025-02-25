import 'package:flutter/material.dart';
import 'package:onelook/constants/app_color.dart';

@immutable
class ButtonStyles {

  static var buttonprimary = ElevatedButton.styleFrom(
    padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 20),
    backgroundColor: AppColors.purpleplum,
    shadowColor: AppColors.voilet,
    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20),
    side: BorderSide(
      color: AppColors.purpleplum,
      width: 1
      )
    ),
    elevation: 0
  );

  static var smallprimary = OutlinedButton.styleFrom(
    padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
    //borderRadius: BorderRadius.circular(20),
    side: BorderSide(
      color: AppColors.purpleplum,
      width: 1
      ),
    elevation: 0
  );
}