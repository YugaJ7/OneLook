import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onelook/constants/app_color.dart';
import 'package:onelook/components/style/text.dart';

class CustomDropdown extends StatefulWidget {
  final String label;
  final List<String> options;
  final RxString selected;
  final void Function(String)? onChanged;

  const CustomDropdown({
    super.key,
    required this.label,
    required this.options,
    required this.selected,
    this.onChanged,
  });

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  var expanded = false.obs;

  void toggleDropdown() => expanded.toggle();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        decoration: BoxDecoration(
          color: AppColors.lilacPetals,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: AppColors.lilacPetalsDark),
        ),
        child: Column(
          children: [
            if (!expanded.value)
              InkWell(
                onTap: toggleDropdown,
                borderRadius: BorderRadius.circular(14),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(widget.selected.value,
                          style: TextStyles.withColor(textcolor: AppColors.deepBlue).bodytext2),
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.keyboard_arrow_down, color: AppColors.deepBlue, size: 24),
                      ),
                    ],
                  ),
                ),
              ),

            if (expanded.value)
              ...widget.options.asMap().entries.map((entry) {
                final index = entry.key;
                final option = entry.value;
                final isSelected = widget.selected.value == option;

                return Column(
                  children: [
                    if (index != 0)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Divider(height: 0, color: AppColors.violet),
                      ),
                    InkWell(
                      onTap: () {
                        widget.selected.value = option;
                        widget.onChanged?.call(option);
                        expanded.value = false;
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: isSelected
                                  ? BoxDecoration(
                                      color: AppColors.violetLight,
                                      borderRadius: BorderRadius.circular(8),
                                    )
                                  : null,
                              child: Text(
                                option,
                                style: TextStyles.withColor(textcolor: AppColors.deepBlue).bodytext2,
                              ),
                            ),
                            if (index == 0)
                              Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: AppColors.violetLight,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(Icons.keyboard_arrow_up,
                                    color: AppColors.deepBlue, size: 24),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }),
          ],
        ),
      );
    });
  }
}
