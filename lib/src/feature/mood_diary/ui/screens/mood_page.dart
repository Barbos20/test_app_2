import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:test_app_2/src/common/localization/l10n.dart';
import 'package:test_app_2/src/feature/mood_diary/widgets/btn.dart';
import 'package:test_app_2/src/feature/mood_diary/widgets/feel.dart';
import 'package:test_app_2/src/feature/mood_diary/widgets/notes.dart';
import 'package:test_app_2/src/feature/mood_diary/widgets/self_assessment.dart';
import 'package:test_app_2/src/feature/mood_diary/widgets/stress_level.dart';
import 'package:test_app_2/src/widgets/body_with_padding.dart';

class MoodPage extends StatefulWidget {
  const MoodPage({
    super.key,
    this.onNext,
    this.onBack,
  });

  final VoidCallback? onNext;
  final VoidCallback? onBack;

  @override
  State<MoodPage> createState() => _MoodPageState();
}

class _MoodPageState extends State<MoodPage> {
  TextEditingController notesController = TextEditingController();
  String? selectedPoint;
  String? selectedDescription;
  double stressSliderValue = 2.5;
  double selfAssessmentSliderValue = 2.5;

  void onPointSelected(String point) {
    setState(() {
      selectedPoint = point;
    });
  }

  void onDescriptionSelected(String description) {
    setState(() {
      selectedDescription = description;
    });
  }

  void _updateStressSliderValue(double value) {
    setState(() {
      stressSliderValue = value;
    });
  }

  void _updateSelfAssessmentSliderValue(double value) {
    setState(() {
      selfAssessmentSliderValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: bodyWithPadding(
        child: Center(
          child: Column(
            children: [
              Feel(
                selectedPoint: selectedPoint,
                selectedDescription: selectedDescription,
                onPointSelected: onPointSelected,
                onDescriptionSelected: onDescriptionSelected,
              ),
              const Gap(36),
              StressLevel(
                sliderValue: stressSliderValue,
                onSliderChange: _updateStressSliderValue,
                leftTitle: Localized.of(context).lowLevel,
                rightTitle: Localized.of(context).hightLevel,
              ),
              const Gap(36),
              SelfAssessment(
                sliderValue: selfAssessmentSliderValue,
                onSliderChange: _updateSelfAssessmentSliderValue,
                leftTitle: Localized.of(context).uncertainty,
                rightTitle: Localized.of(context).confidence,
              ),
              const Gap(36),
              Notes(notesController: notesController),
              const Gap(16),
              btn(
                context: context,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
