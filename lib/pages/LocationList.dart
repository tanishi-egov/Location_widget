import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
import 'package:location_widget1/bloc/location_bloc.dart';
import 'package:location_widget1/routes/app_router.dart';

class LocationList extends StatefulWidget {
  final ScrollController controller;
  final List<String> filteredLocations;

  const LocationList(
      {super.key, required this.controller, required this.filteredLocations});

  @override
  LocationListState createState() => LocationListState();
}

class LocationListState extends State<LocationList> {
  @override
  Widget build(BuildContext context) {
    ScrollController controller = widget.controller;
    List<String> filteredLocations = widget.filteredLocations;

    return BlocListener<LocationBloc, LocationState>(
        listener: (context, state) {
          if (state.isLoading) {
            const CircularProgressIndicator();
          } else if (!state.isLoading && state.weather != null) {
            AutoRouter.of(context)
                .push(WeatherAppRoute(weather: state.weather));
            // Navigator.push(
            //     context,
            //     MaterialPageRoute(
            //         builder: (context) =>
            //             WeatherAppScreen(weather: state.weather)));
          }
        },
        child: ListView.builder(
          controller: controller,
          itemCount: filteredLocations.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: const Icon(
                Icons.location_city,
                color: Color(0xFF4C6AB1),
              ),
              title: Text(
                widget.filteredLocations[index],
                style: const TextStyle(
                    color: Color.fromARGB(255, 76, 106, 177),
                    fontFamily: 'Poppins'),
              ),
              onTap: () {
                context.read<LocationBloc>().add(GetWeatherDetails(
                    place: filteredLocations[index].toString()));
              },
            );
          },
        ));
  }
}
