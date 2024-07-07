// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    MoodDiaryRootRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MoodDiaryRootPage(),
      );
    },
    MoodDiaryRoute.name: (routeData) {
      final args = routeData.argsAs<MoodDiaryRouteArgs>(
          orElse: () => const MoodDiaryRouteArgs());
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: MoodDiaryScreen(key: args.key),
      );
    },
  };
}

/// generated route for
/// [MoodDiaryRootPage]
class MoodDiaryRootRoute extends PageRouteInfo<void> {
  const MoodDiaryRootRoute({List<PageRouteInfo>? children})
      : super(
          MoodDiaryRootRoute.name,
          initialChildren: children,
        );

  static const String name = 'MoodDiaryRootRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MoodDiaryScreen]
class MoodDiaryRoute extends PageRouteInfo<MoodDiaryRouteArgs> {
  MoodDiaryRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          MoodDiaryRoute.name,
          args: MoodDiaryRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'MoodDiaryRoute';

  static const PageInfo<MoodDiaryRouteArgs> page =
      PageInfo<MoodDiaryRouteArgs>(name);
}

class MoodDiaryRouteArgs {
  const MoodDiaryRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'MoodDiaryRouteArgs{key: $key}';
  }
}
