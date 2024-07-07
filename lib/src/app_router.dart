import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_app_2/src/feature/mood_diary/ui/mood_diary_root_page.dart';
import 'package:test_app_2/src/feature/mood_diary/ui/screens/mood_diary_screen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: MoodDiaryRootRoute.page,
          initial: true,
          path: '/mood-diary-screen',
          children: [
            AutoRoute(
              initial: true,
              page: MoodDiaryRoute.page,
              path: 'mood-diary-screen',
            ),
          ],
        ),
      ];
}
