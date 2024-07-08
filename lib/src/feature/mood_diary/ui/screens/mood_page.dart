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
  final Function(String) onPointSelected;
  final Function(String) onDescriptionSelected;
  final Function(double) onStressSliderChange;
  final Function(double) onSelfAssessmentSliderChange;
  final Function(String) onNotesChange;

  const MoodPage({
    super.key,
    required this.onPointSelected,
    required this.onDescriptionSelected,
    required this.onStressSliderChange,
    required this.onSelfAssessmentSliderChange,
    required this.onNotesChange,
  });

  @override
  State<MoodPage> createState() => _MoodPageState();
}

class _MoodPageState extends State<MoodPage>
    with AutomaticKeepAliveClientMixin {
  TextEditingController notesController = TextEditingController();
  String? selectedPoint;
  String? selectedDescription;
  double stressSliderValue = 2.5;
  double selfAssessmentSliderValue = 2.5;

  void onPointSelected(String point) {
    setState(() {
      selectedPoint = point;
    });
    widget.onPointSelected(point);
  }

  void onDescriptionSelected(String description) {
    setState(() {
      selectedDescription = description;
    });
    widget.onDescriptionSelected(description);
  }

  void _updateStressSliderValue(double value) {
    setState(() {
      stressSliderValue = value;
    });
    widget.onStressSliderChange(value);
  }

  void _updateSelfAssessmentSliderValue(double value) {
    setState(() {
      selfAssessmentSliderValue = value;
    });
    widget.onSelfAssessmentSliderChange(value);
  }

  @override
  void initState() {
    super.initState();
    notesController.addListener(_onNotesChanged);
  }

  void _onNotesChanged() {
    setState(() {
      widget.onNotesChange(notesController.text);
    });
  }

  @override
  void dispose() {
    notesController.removeListener(_onNotesChanged);
    notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: SingleChildScrollView(
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
                  isActive: notesController.text.isNotEmpty &&
                      selectedPoint != null &&
                      selectedDescription != null &&
                      stressSliderValue != 2.5 &&
                      selfAssessmentSliderValue != 2.5,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
