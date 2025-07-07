import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onelook/constants/app_color.dart';
import 'package:onelook/components/style/text.dart';
import 'package:onelook/components/widgets/common/duration_picker.dart';
import 'package:onelook/controllers/add_activity.dart';

class CustomTimeBottomSheet extends StatefulWidget {
  const CustomTimeBottomSheet({super.key});

  @override
  State<CustomTimeBottomSheet> createState() => _CustomTimeBottomSheetState();
}

class _CustomTimeBottomSheetState extends State<CustomTimeBottomSheet> {
  final AddActivityController controller = Get.find();

  int selectedHour = 0;
  int selectedMinute = 0;

  @override
  void initState() {
    super.initState();
    selectedHour = controller.customHour.value;
    selectedMinute = controller.customMinute.value;
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
                  controller.customHour.value = selectedHour;
                  controller.customMinute.value = selectedMinute;
                  controller.isCustomTimeSelected.value = true;
                  controller.selectedTimeOption.value = "Custom";
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
