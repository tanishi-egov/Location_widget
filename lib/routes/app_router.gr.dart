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
    MyBodyRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MyBodyScreen(),
      );
    },
    WeatherAppRoute.name: (routeData) {
      final args = routeData.argsAs<WeatherAppRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: WeatherAppScreen(
          key: args.key,
          weather: args.weather,
        ),
      );
    },
  };
}

/// generated route for
/// [MyBodyScreen]
class MyBodyRoute extends PageRouteInfo<void> {
  const MyBodyRoute({List<PageRouteInfo>? children})
      : super(
          MyBodyRoute.name,
          initialChildren: children,
        );

  static const String name = 'MyBodyRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [WeatherAppScreen]
class WeatherAppRoute extends PageRouteInfo<WeatherAppRouteArgs> {
  WeatherAppRoute({
    Key? key,
    required WeatherModel? weather,
    List<PageRouteInfo>? children,
  }) : super(
          WeatherAppRoute.name,
          args: WeatherAppRouteArgs(
            key: key,
            weather: weather,
          ),
          initialChildren: children,
        );

  static const String name = 'WeatherAppRoute';

  static const PageInfo<WeatherAppRouteArgs> page =
      PageInfo<WeatherAppRouteArgs>(name);
}

class WeatherAppRouteArgs {
  const WeatherAppRouteArgs({
    this.key,
    required this.weather,
  });

  final Key? key;

  final WeatherModel? weather;

  @override
  String toString() {
    return 'WeatherAppRouteArgs{key: $key, weather: $weather}';
  }
}
