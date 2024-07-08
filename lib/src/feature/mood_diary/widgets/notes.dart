import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:test_app_2/src/common/localization/l10n.dart';
import 'package:test_app_2/src/theme/app_color.dart';
import 'package:test_app_2/src/theme/app_text_style.dart';

class Notes extends StatelessWidget {
  const Notes({
    super.key,
    required this.notesController,
  });

  final TextEditingController notesController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            Localized.of(context).notes,
            style: AppTextStyle.style16w800.copyWith(
              color: AppColors.black,
            ),
          ),
        ),
        const Gap(20),
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(13),
            boxShadow: const [
              BoxShadow(
                color: Color(0x1AB6A1C0),
                offset: Offset(2, 4),
                blurRadius: 10.8,
                spreadRadius: 0,
              ),
            ],
          ),
          child: SizedBox(
            height: 90,
            child: TextField(
              maxLines: 5,
              controller: notesController,
              style: AppTextStyle.style14w400.copyWith(
                color: AppColors.black,
              ),
              cursorColor: AppColors.black,
              decoration: InputDecoration(
                hintText: Localized.of(context).enterNotes,
                hintStyle: const TextStyle(color: Colors.grey),
                filled: true,
                fillColor: Colors.transparent,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(19),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(19),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(19),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
