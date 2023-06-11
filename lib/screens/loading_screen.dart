import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

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
    latitude = locations.latitude;
    longitude = locations.longitude;
    var uri = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey");
    NetworkHelper networkHelper = NetworkHelper(uri);
    var weatherData = await networkHelper.getData();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LoadingScreen();
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
