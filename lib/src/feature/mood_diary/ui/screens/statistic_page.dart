import 'package:flutter/material.dart';
import 'package:test_app_2/src/common/localization/l10n.dart';
import 'package:test_app_2/src/theme/app_color.dart';
import 'package:test_app_2/src/theme/app_text_style.dart';

class StatisticPage extends StatefulWidget {
  final String? selectedPoint;
  final String? selectedDescription;
  final double stressSliderValue;
  final double selfAssessmentSliderValue;
  final String notes;
  final bool isSaved;

  const StatisticPage({
    super.key,
    required this.selectedPoint,
    required this.selectedDescription,
    required this.stressSliderValue,
    required this.selfAssessmentSliderValue,
    required this.notes,
    required this.isSaved,
  });

  @override
  State<StatisticPage> createState() => _StatisticPageState();
}

class _StatisticPageState extends State<StatisticPage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: !widget.isSaved ||
              widget.selectedPoint == null ||
              widget.selectedDescription == null ||
              widget.stressSliderValue == 3.5 ||
              widget.selfAssessmentSliderValue == 3.5 ||
              widget.notes.isEmpty
          ? [
              Text(
                Localized.of(context).errorMessage,
                style: AppTextStyle.style16w800.copyWith(
                  color: AppColors.black,
                ),
              ),
            ]
          : [
              Text(
                Localized.of(context).answerYouFeel(
                    widget.selectedPoint as Object,
                    widget.selectedDescription as Object),
                style: AppTextStyle.style14w400.copyWith(
                  color: AppColors.black,
                ),
              ),
              Text(
                Localized.of(context)
                    .answerStressLevel(widget.stressSliderValue as Object),
                style: AppTextStyle.style14w400.copyWith(
                  color: AppColors.black,
                ),
              ),
              Text(
                Localized.of(context).answerSelfAssessment(
                    widget.selfAssessmentSliderValue as Object),
                style: AppTextStyle.style14w400.copyWith(
                  color: AppColors.black,
                ),
              ),
              Text(
                Localized.of(context).answerNotes(widget.notes as Object),
                style: AppTextStyle.style14w400.copyWith(
                  color: AppColors.black,
                ),
              ),
            ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
