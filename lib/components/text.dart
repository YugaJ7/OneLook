import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  Color? textcolor;
   late final TextStyle headline1;
   late final TextStyle bodytext1;
   TextStyles.withColor({this.textcolor}) {
     headline1 = GoogleFonts.notoSans(
       color: textcolor,
       fontSize: 30,
       fontWeight: FontWeight.bold,
       letterSpacing: .2,
       wordSpacing: 2,
       height: 1.30
     );
     bodytext1 = GoogleFonts.notoSans(
      color: textcolor,
      fontSize: 16,
      fontWeight: FontWeight.normal,
      letterSpacing: .12,
      wordSpacing: 2,
      height: 1.50
   );
   }
   static var buttontext1 = GoogleFonts.notoSans(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    letterSpacing: .12,
    wordSpacing: 2,
    height: 1.50
   );
}