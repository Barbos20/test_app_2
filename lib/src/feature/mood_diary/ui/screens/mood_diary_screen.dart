import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:test_app_2/gen/assets.gen.dart';
import 'package:test_app_2/src/feature/mood_diary/ui/screens/mood_page.dart';
import 'package:test_app_2/src/feature/mood_diary/ui/screens/statistic_page.dart';
import 'package:test_app_2/src/feature/mood_diary/widgets/switch_point.dart';
import 'package:test_app_2/src/theme/app_color.dart';
import 'package:test_app_2/src/theme/app_text_style.dart';

@RoutePage()
class MoodDiaryScreen extends StatefulWidget {
  const MoodDiaryScreen({super.key});

  @override
  State<MoodDiaryScreen> createState() => _MoodDiaryScreenState();
}

class _MoodDiaryScreenState extends State<MoodDiaryScreen> {
  final date = DateFormat('d MMMM HH:mm', 'ru').format(DateTime.now());
  late PageController pageController = PageController();
  double _pageIndex = 0;
  bool isMoodDiarySelected = true;

  // Добавьте состояние для хранения данных
  String? selectedPoint;
  String? selectedDescription;
  double stressSliderValue = 2.5;
  double selfAssessmentSliderValue = 2.5;
  String notes = '';
  bool isSaved = false; // Добавьте это состояние

  void toggleSelection() {
    setState(() {
      isMoodDiarySelected = !isMoodDiarySelected;
    });
  }

  void _handleBack() {
    if (_pageIndex > 0) {
      _transition(pageController, (_pageIndex * 2).toInt() - 1);
    }
  }

  // Функции для обновления данных
  void updateSelectedPoint(String point) {
    setState(() {
      selectedPoint = point;
    });
  }

  void updateSelectedDescription(String description) {
    setState(() {
      selectedDescription = description;
    });
  }

  void updateStressSliderValue(double value) {
    setState(() {
      stressSliderValue = value;
    });
  }

  void updateSelfAssessmentSliderValue(double value) {
    setState(() {
      selfAssessmentSliderValue = value;
    });
  }

  void updateNotes(String notes) {
    setState(() {
      this.notes = notes;
    });
  }

  void updateIsSaved(bool value) {
    setState(() {
      isSaved = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.white,
          title: Text(
            date,
            style: AppTextStyle.style18w700.copyWith(
              color: AppColors.grey2,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: () {},
                child: SvgPicture.asset(
                  Assets.icons.calendar,
                  width: 24,
                  height: 24,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            SwitchPoint(
              toggleSelection: () {
                toggleSelection();
                _transition(pageController, isMoodDiarySelected ? 0 : 1);
              },
              isMoodDiarySelected: isMoodDiarySelected,
            ),
            const Gap(15),
            Expanded(
              child: PageView.builder(
                key: const PageStorageKey('pageViewKey'),
                physics: const NeverScrollableScrollPhysics(),
                controller: pageController,
                onPageChanged: (value) {
                  setState(() {
                    _pageIndex = value / 9;
                  });
                },
                itemBuilder: (context, index) {
                  switch (index) {
                    case 0:
                      return MoodPage(
                        onPointSelected: updateSelectedPoint,
                        onDescriptionSelected: updateSelectedDescription,
                        onStressSliderChange: updateStressSliderValue,
                        onSelfAssessmentSliderChange:
                            updateSelfAssessmentSliderValue,
                        onNotesChange: updateNotes,
                        onSave: updateIsSaved, // Передайте функцию обновления
                      );
                    case 1:
                      return StatisticPage(
                        selectedPoint: selectedPoint,
                        selectedDescription: selectedDescription,
                        stressSliderValue: stressSliderValue + 1,
                        selfAssessmentSliderValue:
                            selfAssessmentSliderValue + 1,
                        notes: notes,
                        isSaved: isSaved,
                      );
                  }
                  return null;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

_transition(PageController pageController, int pageIndex) =>
    pageController.animateToPage(
      pageIndex,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
    );
