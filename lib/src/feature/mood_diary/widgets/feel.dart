import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:test_app_2/gen/assets.gen.dart';
import 'package:test_app_2/src/common/localization/l10n.dart';
import 'package:test_app_2/src/theme/app_color.dart';
import 'package:test_app_2/src/theme/app_text_style.dart';

Widget feel({required BuildContext context}) {
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
      ClipRect(
        clipBehavior: Clip.none,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          clipBehavior: Clip.none,
          child: Row(
            children: List.generate(pages.length, (index) {
              return Container(
                height: 118,
                width: 83,
                margin: const EdgeInsets.only(right: 12),
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(76),
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
              );
            }),
          ),
        ),
      ),
    ],
  );
}
