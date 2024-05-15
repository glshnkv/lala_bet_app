// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    CityOfGodsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CityOfGodsScreen(),
      );
    },
    DailyRewardRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DailyRewardScreen(),
      );
    },
    FortuneWheelRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const FortuneWheelScreen(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    LoadingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LoadingScreen(),
      );
    },
    LoseRoute.name: (routeData) {
      final args = routeData.argsAs<LoseRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LoseScreen(
          key: args.key,
          onTap: args.onTap,
          arrows: args.arrows,
        ),
      );
    },
    MysteriousFishingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MysteriousFishingScreen(),
      );
    },
    RulesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const RulesScreen(),
      );
    },
    SpaceAdventuresRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SpaceAdventuresScreen(),
      );
    },
    WinRoute.name: (routeData) {
      final args = routeData.argsAs<WinRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WinScreen(
          key: args.key,
          onTap: args.onTap,
        ),
      );
    },
  };
}

/// generated route for
/// [CityOfGodsScreen]
class CityOfGodsRoute extends PageRouteInfo<void> {
  const CityOfGodsRoute({List<PageRouteInfo>? children})
      : super(
          CityOfGodsRoute.name,
          initialChildren: children,
        );

  static const String name = 'CityOfGodsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DailyRewardScreen]
class DailyRewardRoute extends PageRouteInfo<void> {
  const DailyRewardRoute({List<PageRouteInfo>? children})
      : super(
          DailyRewardRoute.name,
          initialChildren: children,
        );

  static const String name = 'DailyRewardRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [FortuneWheelScreen]
class FortuneWheelRoute extends PageRouteInfo<void> {
  const FortuneWheelRoute({List<PageRouteInfo>? children})
      : super(
          FortuneWheelRoute.name,
          initialChildren: children,
        );

  static const String name = 'FortuneWheelRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoadingScreen]
class LoadingRoute extends PageRouteInfo<void> {
  const LoadingRoute({List<PageRouteInfo>? children})
      : super(
          LoadingRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoadingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LoseScreen]
class LoseRoute extends PageRouteInfo<LoseRouteArgs> {
  LoseRoute({
    Key? key,
    required void Function()? onTap,
    required int arrows,
    List<PageRouteInfo>? children,
  }) : super(
          LoseRoute.name,
          args: LoseRouteArgs(
            key: key,
            onTap: onTap,
            arrows: arrows,
          ),
          initialChildren: children,
        );

  static const String name = 'LoseRoute';

  static const PageInfo<LoseRouteArgs> page = PageInfo<LoseRouteArgs>(name);
}

class LoseRouteArgs {
  const LoseRouteArgs({
    this.key,
    required this.onTap,
    required this.arrows,
  });

  final Key? key;

  final void Function()? onTap;

  final int arrows;

  @override
  String toString() {
    return 'LoseRouteArgs{key: $key, onTap: $onTap, arrows: $arrows}';
  }
}

/// generated route for
/// [MysteriousFishingScreen]
class MysteriousFishingRoute extends PageRouteInfo<void> {
  const MysteriousFishingRoute({List<PageRouteInfo>? children})
      : super(
          MysteriousFishingRoute.name,
          initialChildren: children,
        );

  static const String name = 'MysteriousFishingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RulesScreen]
class RulesRoute extends PageRouteInfo<void> {
  const RulesRoute({List<PageRouteInfo>? children})
      : super(
          RulesRoute.name,
          initialChildren: children,
        );

  static const String name = 'RulesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SpaceAdventuresScreen]
class SpaceAdventuresRoute extends PageRouteInfo<void> {
  const SpaceAdventuresRoute({List<PageRouteInfo>? children})
      : super(
          SpaceAdventuresRoute.name,
          initialChildren: children,
        );

  static const String name = 'SpaceAdventuresRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [WinScreen]
class WinRoute extends PageRouteInfo<WinRouteArgs> {
  WinRoute({
    Key? key,
    required void Function()? onTap,
    List<PageRouteInfo>? children,
  }) : super(
          WinRoute.name,
          args: WinRouteArgs(
            key: key,
            onTap: onTap,
          ),
          initialChildren: children,
        );

  static const String name = 'WinRoute';

  static const PageInfo<WinRouteArgs> page = PageInfo<WinRouteArgs>(name);
}

class WinRouteArgs {
  const WinRouteArgs({
    this.key,
    required this.onTap,
  });

  final Key? key;

  final void Function()? onTap;

  @override
  String toString() {
    return 'WinRouteArgs{key: $key, onTap: $onTap}';
  }
}
