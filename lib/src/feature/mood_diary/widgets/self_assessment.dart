import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:test_app_2/src/common/localization/l10n.dart';
import 'package:test_app_2/src/feature/mood_diary/widgets/custom_slider.dart';
import 'package:test_app_2/src/theme/app_color.dart';
import 'package:test_app_2/src/theme/app_text_style.dart';

class SelfAssessment extends StatefulWidget {
  final double sliderValue;
  final ValueChanged<double> onSliderChange;
  final String leftTitle;
  final String rightTitle;

  const SelfAssessment({
    super.key,
    required this.sliderValue,
    required this.onSliderChange,
    required this.leftTitle,
    required this.rightTitle,
  });

  @override
  State<SelfAssessment> createState() => _SelfAssessmentState();
}

class _SelfAssessmentState extends State<SelfAssessment> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            Localized.of(context).selfAssessment,
            style: AppTextStyle.style16w800.copyWith(
              color: AppColors.black,
            ),
          ),
        ),
        const Gap(20),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(13),
            color: AppColors.white,
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
              vertical: 10,
              horizontal: 16,
            ),
            child: Column(
              children: [
                StressSlider(
                  value: widget.sliderValue,
                  onChanged: widget.onSliderChange,
                  leftTitle: widget.leftTitle,
                  rightTitle: widget.rightTitle,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
