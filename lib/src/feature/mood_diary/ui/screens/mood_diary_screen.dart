import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:test_app_2/gen/assets.gen.dart';
import 'package:test_app_2/src/feature/mood_diary/widgets/feel.dart';
import 'package:test_app_2/src/feature/mood_diary/widgets/switch_point.dart';
import 'package:test_app_2/src/theme/app_color.dart';
import 'package:test_app_2/src/theme/app_text_style.dart';
import 'package:test_app_2/src/widgets/body_with_padding.dart';

@RoutePage()
class MoodDiaryScreen extends StatefulWidget {
  const MoodDiaryScreen({super.key});

  @override
  State<MoodDiaryScreen> createState() => _MoodDiaryScreenState();
}

class _MoodDiaryScreenState extends State<MoodDiaryScreen> {
  String? selectedPoint;
  String? selectedDescription;
  bool isMoodDiarySelected = true;
  final date = DateFormat('d MMMM HH:mm', 'ru').format(DateTime.now());

  void toggleSelection() {
    setState(() {
      isMoodDiarySelected = !isMoodDiarySelected;
    });
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Padding(
          padding: const EdgeInsets.only(top: 22),
          child: AppBar(
            title: Text(
              date,
              style: AppTextStyle.style18w700.copyWith(color: AppColors.grey2),
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
      ),
      body: bodyWithPadding(
        child: Center(
          child: Column(
            children: [
              SwitchPoint(
                toggleSelection: toggleSelection,
                isMoodDiarySelected: isMoodDiarySelected,
              ),
              const Gap(30),
              Feel(
                selectedPoint: selectedPoint,
                selectedDescription: selectedDescription,
                onPointSelected: onPointSelected,
                onDescriptionSelected: onDescriptionSelected,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
