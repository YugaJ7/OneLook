import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onelook/constants/app_color.dart';
import 'package:onelook/components/style/text.dart';
import 'package:onelook/components/widgets/common/duration_picker.dart';

class CustomTimeBottomSheet extends StatefulWidget {
  final RxInt customHour;
final RxInt customMinute;
final RxBool isCustomTimeSelected;
final RxString selectedTimeOption;

const CustomTimeBottomSheet({
  super.key,
  required this.customHour,
  required this.customMinute,
  required this.isCustomTimeSelected,
  required this.selectedTimeOption,
});


  @override
  State<CustomTimeBottomSheet> createState() => _CustomTimeBottomSheetState();
}

class _CustomTimeBottomSheetState extends State<CustomTimeBottomSheet> {
  late int selectedHour;
  late int selectedMinute;

  @override
  void initState() {
    super.initState();
    selectedHour = widget.customHour.value;
    selectedMinute = widget.customMinute.value;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Container(
      height: height * 0.38,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Add time",
                  style: TextStyles.withColor(textcolor: AppColors.deepBlue)
                      .headline3),
              GestureDetector(
                onTap: () {
                  widget.customHour.value = selectedHour;
                  widget.customMinute.value = selectedMinute;
                  widget.isCustomTimeSelected.value = true;
                  widget.selectedTimeOption.value = "Custom";
                  Navigator.of(context).pop();
                },
                child: const Icon(Icons.check,
                    color: AppColors.deepBlue, size: 28),
              ),
            ],
          ),
          const SizedBox(height: 16),
          DurationPicker(
            initialHour: selectedHour,
            initialMinute: selectedMinute,
            onChanged: (h, m) {
              selectedHour = h;
              selectedMinute = m;
            },
          ),
        ],
      ),
    );
  }
}
