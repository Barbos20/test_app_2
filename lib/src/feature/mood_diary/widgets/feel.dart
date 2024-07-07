import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:test_app_2/gen/assets.gen.dart';
import 'package:test_app_2/src/common/localization/l10n.dart';
import 'package:test_app_2/src/theme/app_color.dart';
import 'package:test_app_2/src/theme/app_text_style.dart';

class Feel extends StatefulWidget {
  const Feel({
    super.key,
    required this.selectedPoint,
    required this.selectedDescription,
    required this.onPointSelected,
    required this.onDescriptionSelected,
  });

  final String? selectedPoint;
  final String? selectedDescription;
  final Function(String) onPointSelected;
  final Function(String) onDescriptionSelected;

  @override
  FeelState createState() => FeelState();
}

class FeelState extends State<Feel> {
  String? _selectedPoint;
  String? _selectedDescription;

  @override
  void initState() {
    super.initState();
    _selectedPoint = widget.selectedPoint;
    _selectedDescription = widget.selectedDescription;
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      Assets.images.happy.path,
      Assets.images.fear.path,
      Assets.images.anger.path,
      Assets.images.sadness.path,
      Assets.images.calmness.path,
      Assets.images.strong.path,
    ];

    final states = [
      Localized.of(context).happy,
      Localized.of(context).fear,
      Localized.of(context).anger,
      Localized.of(context).sadness,
      Localized.of(context).calmness,
      Localized.of(context).strong,
    ];

    final descriptionStates = [
      Localized.of(context).excitement,
      Localized.of(context).delight,
      Localized.of(context).playfulness,
      Localized.of(context).enjoyment,
      Localized.of(context).charm,
      Localized.of(context).awareness,
      Localized.of(context).courage,
      Localized.of(context).pleasure,
      Localized.of(context).sensuality,
      Localized.of(context).energy,
      Localized.of(context).extravagance,
    ];

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            Localized.of(context).youFeel,
            style: AppTextStyle.style16w800.copyWith(
              color: AppColors.black,
            ),
          ),
        ),
        const Gap(20),
        selectBunny(pages, states),
        if (_selectedPoint != null) const Gap(20),
        if (_selectedPoint != null) selectDescriptionStates(descriptionStates),
      ],
    );
  }

  Wrap selectDescriptionStates(List<String> descriptionStates) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: List.generate(
        descriptionStates.length,
        (index) {
          final isSelected = _selectedDescription == descriptionStates[index];
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedDescription = descriptionStates[index];
              });
              widget.onDescriptionSelected(descriptionStates[index]);
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: isSelected ? AppColors.mandarin : AppColors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x1AB6A1C0),
                    offset: Offset(2, 4),
                    blurRadius: 10.8,
                    spreadRadius: 0,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 3,
                ),
                child: Text(
                  descriptionStates[index],
                  style: AppTextStyle.style11w400.copyWith(
                    color: isSelected ? AppColors.white : AppColors.black,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  ClipRect selectBunny(List<String> pages, List<String> states) {
    return ClipRect(
      clipBehavior: Clip.none,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        child: Row(
          children: List.generate(
            pages.length,
            (index) {
              final isSelected = _selectedPoint == states[index];
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedPoint = states[index];
                  });
                  widget.onPointSelected(states[index]);
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 100),
                  height: 118,
                  width: 83,
                  margin: const EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(76),
                    border: isSelected
                        ? Border.all(
                            color: AppColors.mandarin,
                            width: 2,
                          )
                        : null,
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x1AB6A1C0),
                        offset: Offset(2, 4),
                        blurRadius: 10.8,
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          pages[index],
                          height: 50,
                          width: 53,
                        ),
                        Text(
                          states[index],
                          style: AppTextStyle.style11w400.copyWith(
                            color: AppColors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
