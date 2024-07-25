import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:location_widget1/model/WeatherModel.dart';
import 'package:location_widget1/pages/MyBody.dart';
import 'package:location_widget1/pages/weatherScreen.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        /// routes go here
        AutoRoute(page: MyBodyRoute.page, initial: true),
        AutoRoute(page: WeatherAppRoute.page)
      ];
}
