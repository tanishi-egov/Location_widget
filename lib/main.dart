import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location_widget1/bloc/location_bloc.dart';
import 'package:location_widget1/routes/app_router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  /// Constructs a [MyApp]
  MyApp({super.key});

  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LocationBloc(),
      child: MaterialApp.router(
        routerConfig: _appRouter.config(),
      ),
    );
  }
}
