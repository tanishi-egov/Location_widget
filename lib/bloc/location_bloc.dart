import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

import 'package:location_widget1/model/WeatherModel.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final String apiKey = '12bc0e4fbe5a68c8542dad6b28b889ac';
  final List<String> locationList = [
    "Athens - Greece",
    "Bangalore - India",
    "Bangkok - Thailand",
    "Beijing - China",
    "Berlin - Germany",
    "Buenos Aires - Argentina",
    "Cairo - Egypt",
    "Cape Town - South Africa",
    "Dubai - UAE",
    "Istanbul - Turkey",
    "Jakarta - Indonesia",
    "Lagos - Nigeria",
    "London - UK",
    "Madrid - Spain",
    "Mexico City - Mexico",
    "Moscow - Russia",
    "Nairobi - Kenya",
    "New York - USA",
    "Paris - France",
    "Rio de Janeiro - Brazil",
    "Rome - Italy",
    "Seoul - South Korea",
    "Sydney - Australia",
    "Tokyo - Japan",
    "Toronto - Canada",
    "Varanasi - India"
  ];

  LocationBloc() : super(LocationState()) {
    void _onVisibilityToggle(
        VisiblityToggle event, Emitter<LocationState> emit) {
      emit(LocationState(isVisible: !state.isVisible));
    }

    void _onFilterListEvent(
        FilterListEvent event, Emitter<LocationState> emit) {
      emit(LocationState(
          location: event.value.isEmpty
              ? locationList
              : locationList
                  .where((location) => location
                      .toString()
                      .toLowerCase()
                      .contains(event.value.toString().toLowerCase()))
                  .toList()));
    }

    void _onWeatherDetails(
        GetWeatherDetails event, Emitter<LocationState> emit) async {
      emit(LocationState(isLoading: true));
      String cityName = event.place.toString().split(' ')[0];
      var response = await Dio().get(
          'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey');

      if (response.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(response.toString());
        print(data);
        WeatherModel weathermodel = WeatherModel.fromJSON(data);
        weathermodel.name = event.place.toString();
        emit(LocationState(weather: weathermodel, isLoading: false));
      } else {
        Exception('Fail to load');
      }
    }

    on<VisiblityToggle>(_onVisibilityToggle);
    on<FilterListEvent>(_onFilterListEvent);
    on<GetWeatherDetails>(_onWeatherDetails);
  }
}
