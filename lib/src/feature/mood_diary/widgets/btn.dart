import 'package:flutter/material.dart';
import 'package:test_app_2/src/common/localization/l10n.dart';
import 'package:test_app_2/src/theme/app_color.dart';
import 'package:test_app_2/src/theme/app_text_style.dart';

ElevatedButton btn({
  required BuildContext context,
}) {
  return ElevatedButton(
    onPressed: () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: AppColors.white,
            content: Text(
              Localized.of(context).safeData,
              style: AppTextStyle.style20w400.copyWith(
                color: AppColors.black,
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text(
                  Localized.of(context).close,
                  style: AppTextStyle.style14w400.copyWith(
                    color: AppColors.black,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.mandarin,
      minimumSize: const Size(double.infinity, 50),
    ),
    child: Text(
      Localized.of(context).safe,
      style: AppTextStyle.style20w400.copyWith(
        color: AppColors.white,
      ),
    ),
  );
}
