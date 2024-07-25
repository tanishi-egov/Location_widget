part of 'location_bloc.dart';

class LocationState extends Equatable {
  final bool isVisible;
  final List<String> location;
  final String? place;
  final bool isLoading;
  final WeatherModel? weather;

  LocationState(
      {this.isVisible = true,
      this.location = const [
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
      ],
      this.place,
      this.isLoading = false,
      this.weather});

  @override
  List<Object?> get props => [isVisible, location, place, isLoading, weather];
}

class Loading extends LocationState {}
