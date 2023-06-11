import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/screens/location_screen.dart';

const apiKey = '4c5b86cf1ab33e8139ecd16a4bd5b30e';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late double latitude;
  late double longitude;
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    location locations = location();
    await locations.getCurrentLocation();
    var uri = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=${locations.latitude}&lon=${locations.longitude}&appid=$apiKey&units=metric");
    NetworkHelper networkHelper = NetworkHelper(uri);
    var weatherData = await networkHelper.getData();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LocationScreen(locationWeather: weatherData,);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100,
        ),
      ),

    );
  }
}
