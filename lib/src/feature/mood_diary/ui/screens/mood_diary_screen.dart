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
                        onNext: () => _transition(pageController, 1),
                        onBack: _handleBack,
                      );
                    case 1:
                      return StatisticPage(
                        onNext: () => _transition(pageController, 2),
                        onBack: _handleBack,
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
