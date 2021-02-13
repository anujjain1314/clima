import 'package:clima/screens/location_screen.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apiKey = "0dd79c8e30cae35a38de020408d51215";

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getCurrentLocationWeatherData();
  }

  void getCurrentLocationWeatherData() async {
    Location location = new Location();
    await location.getCurrentLocation();

    NetworkingHelper networkingHelper = new NetworkingHelper(
        url:
            "https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric");

    var weatherData = await networkingHelper.getData();
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => LocationScreen(weatherData)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitRotatingCircle(
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}
