import 'package:flutter/material.dart';
import 'package:onelook/constants/app_color.dart';

class MenuOption extends StatelessWidget {
  final String text;
  final String? suffixIcon;
  final VoidCallback onTap;
  final TextStyle? textStyle;
  final String? prefixIcon;

  const MenuOption({
    super.key,
    required this.text,
    required this.textStyle,
    this.suffixIcon,
    this.prefixIcon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: MediaQuery.of(context).size.height * 0.08,
        child: GestureDetector(
          onTap: onTap,
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            prefixIcon != null
                ? Row(children: [
                    Image.asset(prefixIcon!, scale: 3.5),
                    SizedBox(width: 20)
                  ])
                : SizedBox(width: 0),
            Text(
              text,
              style: textStyle,
            ),
            Spacer(),
            suffixIcon != null
                ? Image.asset(suffixIcon!, scale: 3.5)
                : SizedBox(width: 0),
          ]),
        ),
      ),
      Divider(color: AppColors.lightGrey, thickness: 1, height: 0),
    ]);
  }
}
