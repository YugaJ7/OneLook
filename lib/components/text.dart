import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onelook/constants/app_color.dart';

class TextStyles {
  Color? textcolor;
   late final TextStyle headline1;
   late final TextStyle headline2;
   late final TextStyle bodytext1;
   late final TextStyle bodytext2;
   late final TextStyle bodytext3;
   TextStyles.withColor({this.textcolor}) {
     headline1 = GoogleFonts.notoSans(
       color: textcolor,
       fontSize: 30,
       fontWeight: FontWeight.bold,
       letterSpacing: .2,
       wordSpacing: 2,
       height: 1.30
     );
     headline2 = GoogleFonts.notoSans(
       color: textcolor,
       fontSize: 20,
       fontWeight: FontWeight.bold,
       letterSpacing: 1.2,
       wordSpacing: 2,
       height: 1.30
     );
     bodytext1 = GoogleFonts.notoSans(
      color: textcolor,
      fontSize: 16,
      fontWeight: FontWeight.normal,
      letterSpacing: 1.2,
      //wordSpacing: 2,
      height: 1.50
    );
    bodytext2 = GoogleFonts.notoSans(
      color: textcolor,
      fontSize: 14,
      fontWeight: FontWeight.normal,
      letterSpacing: 1.2,
      //wordSpacing: 2,
      height: 1.50
    );
    bodytext3 = GoogleFonts.notoSans(
      color: textcolor,
      fontSize: 12,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.2,
      //wordSpacing: 2,
      height: 1.50
    );
   }
   static var buttontext1 = GoogleFonts.notoSans(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.2,
    wordSpacing: 2,
    height: 1.50
   );
  static var buttontext2 = GoogleFonts.notoSans(
    color: AppColors.purpleplum,
    fontSize: 12,
    fontWeight: FontWeight.w600,
    letterSpacing: 1.2,
    wordSpacing: 2,
    height: 1.50
   );
}