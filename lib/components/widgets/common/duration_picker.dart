import 'package:flutter/material.dart';
import 'package:onelook/components/style/text.dart';
import 'package:onelook/constants/app_color.dart';

class DurationPicker extends StatefulWidget {
  final int initialHour;
  final int initialMinute;
  final void Function(int hour, int minute) onChanged;

  const DurationPicker({
    super.key,
    required this.initialHour,
    required this.initialMinute,
    required this.onChanged,
  });

  @override
  State<DurationPicker> createState() => _DurationPickerState();
}

class _DurationPickerState extends State<DurationPicker> {
  late FixedExtentScrollController hourController;
  late FixedExtentScrollController minuteController;

  int selectedHour = 0;
  int selectedMinute = 0;

  @override
  void initState() {
    super.initState();
    selectedHour = widget.initialHour;
    selectedMinute = widget.initialMinute;

    hourController = FixedExtentScrollController(initialItem: selectedHour);
    minuteController = FixedExtentScrollController(initialItem: selectedMinute);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Center(
      child: Container(
        height: height * 0.23,
        width: width * 0.54,
        decoration: BoxDecoration(
          color: AppColors.lilacPetals,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Highlight box
            Positioned(
              top: (height * 0.23 - 40) / 2,
              left: 0,
              right: 0,
              child: Container(
                height: 40,
                margin: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: AppColors.violetLight,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            // Scrollable wheels
            ShaderMask(
              shaderCallback: (bounds) {
                return const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black,
                    Colors.black,
                    Colors.transparent,
                  ],
                  stops: [0.0, 0.3, 0.7, 1.0],
                ).createShader(bounds);
              },
              blendMode: BlendMode.dstIn,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildWheel(
                    controller: hourController,
                    count: 24,
                    selectedIndex: selectedHour,
                    onChanged: (val) {
                      setState(() => selectedHour = val);
                      widget.onChanged(val, selectedMinute);
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(":",
                        style:
                            TextStyles.withColor(textcolor: AppColors.deepBlue)
                                .headline2),
                  ),
                  _buildWheel(
                    controller: minuteController,
                    count: 60,
                    selectedIndex: selectedMinute,
                    onChanged: (val) {
                      setState(() => selectedMinute = val);
                      widget.onChanged(selectedHour, val);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWheel({
    required FixedExtentScrollController controller,
    required int count,
    required int selectedIndex,
    required Function(int) onChanged,
  }) {
    return SizedBox(
      width: 60,
      child: ListWheelScrollView.useDelegate(
        controller: controller,
        itemExtent: 40,
        squeeze: 1.0,
        perspective: 0.001,
        diameterRatio: 1.5,
        physics: const FixedExtentScrollPhysics(),
        onSelectedItemChanged: onChanged,
        overAndUnderCenterOpacity: 0.9,
        childDelegate: ListWheelChildBuilderDelegate(
          childCount: count,
          builder: (context, index) {
            final isSelected = index == selectedIndex;
            return AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 100),
              style: isSelected
                  ? TextStyles.withColor(textcolor: AppColors.deepBlue)
                      .headline2
                  : TextStyles.withColor(textcolor: AppColors.darkGrey)
                      .bodytext1,
              child: Center(
                child: Text(index.toString().padLeft(2, '0')),
              ),
            );
          },
        ),
      ),
    );
  }
}
