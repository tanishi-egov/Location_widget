part of 'location_bloc.dart';

sealed class LocationEvent extends Equatable {
  const LocationEvent();

  @override
  List<Object> get props => [];
}

final class VisiblityToggle extends LocationEvent {}

final class FilterListEvent extends LocationEvent {
  final String value;
  const FilterListEvent({required this.value});

  @override
  List<String> get props => [value];
}

final class GetWeatherDetails extends LocationEvent {
  final String place;
  const GetWeatherDetails({required this.place});
  @override
  List<String> get props => [place];
}
