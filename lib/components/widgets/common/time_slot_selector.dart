import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onelook/components/widgets/common/form_option_tile.dart';
import 'package:onelook/components/widgets/buttons/outlined_button.dart';
import 'package:onelook/components/widgets/bottomsheet/time_sheet.dart';
import 'package:onelook/controllers/home/add_supplement.dart';
import 'package:onelook/components/style/text.dart';
import 'package:onelook/components/style/button.dart';

class TimeSlotSelector extends StatelessWidget {
  final int index;
  final AddSupplementController controller;

  const TimeSlotSelector({
    super.key,
    required this.index,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 92,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: controller.timesOfDay.length,
            itemBuilder: (_, idx) {
              final item = controller.timesOfDay[idx];
              return Obx(() {
                final isSelected =
                    controller.selectedTimeOptions[index].value == item['label'];
                return FormOptionTile(
                  icon: item['icon']!,
                  label: item['label']!,
                  selected: isSelected,
                  onTap: () => controller.setPresetTime(index, item['label']!),
                );
              });
            },
            separatorBuilder: (_, __) => const SizedBox(width: 16),
          ),
        ),
        const SizedBox(height: 16),
        Obx(() {
          return CustomOutlinedButton(
            text: controller.isCustomTimeSelected[index].value
                ? controller.customTimeDisplayList[index]
                : "Add Custom Time",
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                builder: (_) => CustomTimeBottomSheet(
                  customHour: controller.customHour,
                  customMinute: controller.customMinute,
                  isCustomTimeSelected: controller.isCustomTimeSelected[index],
                  selectedTimeOption: controller.selectedTimeOptions[index],
                ),
              );
            },
            textStyle: TextStyles.buttontext2,
            buttonStyle: ButtonStyles.smallprimary,
          );
        }),
        const SizedBox(height: 24),
      ],
    );
  }
}
