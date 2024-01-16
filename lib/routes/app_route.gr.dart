// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_route.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    CatsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CatsScreen(),
      );
    },
    DogsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const DogsScreen(),
      );
    },
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainScreen(),
      );
    },
  };
}

/// generated route for
/// [CatsScreen]
class CatsRoute extends PageRouteInfo<void> {
  const CatsRoute({List<PageRouteInfo>? children})
      : super(
          CatsRoute.name,
          initialChildren: children,
        );

  static const String name = 'CatsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [DogsScreen]
class DogsRoute extends PageRouteInfo<void> {
  const DogsRoute({List<PageRouteInfo>? children})
      : super(
          DogsRoute.name,
          initialChildren: children,
        );

  static const String name = 'DogsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainScreen]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
