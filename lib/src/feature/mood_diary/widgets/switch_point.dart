import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:test_app_2/gen/assets.gen.dart';
import 'package:test_app_2/src/common/localization/l10n.dart';
import 'package:test_app_2/src/theme/app_color.dart';
import 'package:test_app_2/src/theme/app_text_style.dart';

class SwitchPoint extends StatefulWidget {
  final VoidCallback toggleSelection;
  final bool isMoodDiarySelected;

  const SwitchPoint({
    required this.toggleSelection,
    required this.isMoodDiarySelected,
    super.key,
  });

  @override
  SwitchPointState createState() => SwitchPointState();
}

class SwitchPointState extends State<SwitchPoint> {
  GlobalKey firstKey = GlobalKey();
  GlobalKey secondKey = GlobalKey();
  GlobalKey rowKey = GlobalKey();
  double firstWidth = 0.0;
  double secondWidth = 0.0;
  double rowHeight = 0.0;
  bool isWidthCalculated = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!isWidthCalculated) {
        setState(() {
          isWidthCalculated = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          final RenderBox? firstRenderBox =
              firstKey.currentContext?.findRenderObject() as RenderBox?;
          final RenderBox? secondRenderBox =
              secondKey.currentContext?.findRenderObject() as RenderBox?;
          final RenderBox? rowRenderBox =
              secondKey.currentContext?.findRenderObject() as RenderBox?;
          final newFirstWidth = firstRenderBox?.size.width ?? 0.0;
          final newSecondWidth = secondRenderBox?.size.width ?? 0.0;
          final newRowHeight = rowRenderBox?.size.height ?? 0.0;

          if (newFirstWidth != firstWidth ||
              newSecondWidth != secondWidth ||
              newRowHeight != rowHeight) {
            setState(() {
              firstWidth = newFirstWidth;
              secondWidth = newSecondWidth;
              rowHeight = newRowHeight;
              isWidthCalculated = true;
            });
          }
        });

        return Container(
          decoration: BoxDecoration(
            color: AppColors.grey4,
            borderRadius: BorderRadius.circular(47),
          ),
          child: FittedBox(
            child: Stack(
              children: [
                if (isWidthCalculated)
                  AnimatedPositioned(
                    duration: const Duration(milliseconds: 200),
                    left: widget.isMoodDiarySelected ? 0 : firstWidth,
                    right: widget.isMoodDiarySelected ? secondWidth : 0,
                    child: Container(
                      height: rowHeight,
                      decoration: BoxDecoration(
                        color: AppColors.mandarin,
                        borderRadius: BorderRadius.circular(47),
                      ),
                    ),
                  ),
                Row(
                  key: rowKey,
                  children: [
                    InkWell(
                      key: firstKey,
                      highlightColor: Colors.transparent,
                      borderRadius: BorderRadius.circular(47),
                      onTap: () {
                        if (!widget.isMoodDiarySelected) {
                          widget.toggleSelection();
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 11,
                          horizontal: 17,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              Assets.icons.book,
                              color: widget.isMoodDiarySelected
                                  ? AppColors.white
                                  : AppColors.grey2,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              Localized.of(context).moodDiary,
                              style: AppTextStyle.style12w500.copyWith(
                                color: widget.isMoodDiarySelected
                                    ? AppColors.white
                                    : AppColors.grey2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      key: secondKey,
                      highlightColor: Colors.transparent,
                      borderRadius: BorderRadius.circular(47),
                      onTap: () {
                        if (widget.isMoodDiarySelected) {
                          widget.toggleSelection();
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 11,
                          horizontal: 17,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              Assets.icons.statistic,
                              color: !widget.isMoodDiarySelected
                                  ? AppColors.white
                                  : AppColors.grey2,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              Localized.of(context).static,
                              style: AppTextStyle.style12w500.copyWith(
                                color: !widget.isMoodDiarySelected
                                    ? AppColors.white
                                    : AppColors.grey2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
