class WeatherModel {
  String temp;
  String weatherDescripton;
  String feelsLike;
  String name;
  int weatherId;

  WeatherModel(this.weatherDescripton, this.temp, this.name, this.feelsLike,
      this.weatherId);

  factory WeatherModel.fromJSON(Map<String, dynamic> json) {
    return WeatherModel(
        json['weather'][0]['description'].toString(),
        (json['main']['temp'] - 273).toStringAsFixed(2) + " C",
        json['name'].toString(),
        (json['main']['feels_like'] - 273).toStringAsFixed(2) + " C",
        json['weather'][0]['id'] as int);
  }
}
