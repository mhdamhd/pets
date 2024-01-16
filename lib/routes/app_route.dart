import 'package:auto_route/auto_route.dart';
import 'package:pets/features/cats/presentation/screens/cats_screen.dart';
import 'package:pets/features/dogs/presentation/screens/dogs_screen.dart';
import 'package:pets/features/main/presentation/screens/main_screen.dart';

part 'app_route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {

  @override
  RouteType get defaultRouteType =>
      const RouteType.material(); //.cupertino, .adaptive ..etc

  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: MainRoute.page, initial: true),
        AutoRoute(page: DogsRoute.page),
        AutoRoute(page: CatsRoute.page),
      ];
}
