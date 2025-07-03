import 'package:flutter/material.dart';
import 'package:onelook/components/style/text.dart';
import 'package:onelook/constants/app_color.dart';

class FinalDropdown extends StatefulWidget {
  const FinalDropdown({super.key});

  @override
  State<FinalDropdown> createState() => _FinalDropdownState();
}

class _FinalDropdownState extends State<FinalDropdown> {
  final List<String> options = [
    'Everyday',
    'Weekdays',
    'Every other day',
    'Weekends',
  ];

  final LayerLink _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  final GlobalKey _key = GlobalKey();

  String selectedValue = 'Everyday';

  void showOverlay() {
    final renderBox = _key.currentContext!.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    _overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          // Block background scroll/tap
          Positioned.fill(
            child: GestureDetector(
              onTap: removeOverlay,
              child: Container(color: Colors.transparent),
            ),
          ),

          // Dropdown box
          Positioned(
            left: offset.dx,
            top: offset.dy,
            width: size.width,
            child: Material(
              color: Colors.transparent,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.lilacPetals,
                  border: Border.all(color: AppColors.purplePlum),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: options.map((value) {
                    final isSelected = value == selectedValue;
                    final isFirst = value == options.first;

                    return Column(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() => selectedValue = value);
                            removeOverlay();
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  decoration: isSelected
                                      ? BoxDecoration(
                                          color: AppColors.violetLight,
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        )
                                      : const BoxDecoration(),
                                  child: Text(
                                    value,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Color(0xFF0A1A3D),
                                    ),
                                  ),
                                ),
                                if (isFirst)
                                  Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: AppColors.violetLight,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.keyboard_arrow_up,
                  size: 24,
                  color: AppColors.deepBlue,
                ),
              ),
                              ],
                            ),
                          ),
                        ),
                        if (value != options.last)
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Divider(
                              color: AppColors.violet,
                              height: 0,
                              thickness: 1,
                            ),
                          ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  void dispose() {
    removeOverlay();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: GestureDetector(
        key: _key,
        onTap: () {
          if (_overlayEntry == null) {
            showOverlay();
          } else {
            removeOverlay();
          }
        },
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.lilacPetals,
            border: Border.all(color: AppColors.lilacPetalsDark),
            borderRadius: BorderRadius.circular(14),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                selectedValue,
                style: TextStyles.withColor(textcolor: AppColors.deepBlue)
                    .bodytext2,
              ),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: _overlayEntry == null ? Colors.transparent : AppColors.violetLight,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  _overlayEntry == null
                      ? Icons.keyboard_arrow_down
                      : Icons.keyboard_arrow_up,
                  size: 24,
                  color: AppColors.deepBlue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
