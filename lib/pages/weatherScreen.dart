import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:location_widget1/model/WeatherModel.dart';
import 'package:location_widget1/pages/constants.dart';

@RoutePage()
class WeatherAppScreen extends StatefulWidget {
  final WeatherModel? weather;
  const WeatherAppScreen({super.key, required this.weather});

  @override
  WeatherAppScreenState createState() => WeatherAppScreenState(weather);
}

class WeatherAppScreenState extends State<WeatherAppScreen> {
  final WeatherModel? weather;
  WeatherAppScreenState(this.weather);

  Widget? weatherImage;
  @override
  void initState() {
    super.initState();
    weatherImage = getImage(weather!.weatherId);
  }

  Widget getImage(int id) {
    if (id >= 200 && id < 300) {
      return Image.asset('assets/images/thunderclouds.png');
    } else if (id >= 300 && id < 400) {
      return Image.asset('assets/images/Drizzle.png');
    } else if (id >= 500 && id < 600) {
      return Image.asset('assets/images/rain.png');
    } else if (id == 800) {
      return Image.asset('assets/images/ClearSky.png');
    } else if (id >= 600 && id < 700) {
      return Image.asset('assets/images/snow.png');
    } else if (id > 800 && id < 900) {
      return Image.asset('assets/images/Clouds.png');
    }

    return Image.asset('assets/images/Haze.png');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFabc4ff),
          title: const Text('Weather',
              style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Color.fromARGB(255, 76, 106, 177))),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.all(MediaQuery.of(context).size.height * 0.08),
            color: const Color(0xFFe2eafc),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                    child: Text(
                  weather!.name,
                  style: styling.headingTextStyle,
                )),
                Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    padding: EdgeInsets.all(
                        MediaQuery.of(context).size.height * 0.05),
                    child: weatherImage ?? getImage(weather!.weatherId)),
                Container(
                  padding: EdgeInsets.all(
                      MediaQuery.of(context).size.height * 0.005),
                  child: Text(weather!.temp, style: styling.tempStyle),
                ),
                Container(
                  padding: EdgeInsets.all(
                      MediaQuery.of(context).size.height * 0.005),
                  child: Text(weather!.weatherDescripton.toUpperCase(),
                      style: styling.NormalTextStyle),
                ),
                Container(
                  padding: EdgeInsets.all(
                      MediaQuery.of(context).size.height * 0.005),
                  child: Text('Feels Like : ${weather!.feelsLike}',
                      style: styling.SmallTextStyle),
                )
              ],
            ),
          ),
        ));
  }
}
