import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima/services/location.dart';
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    getPosition();
  }


  void getPosition() async {
    location locations=location();
    await locations.getCurrentLocation();
    print(locations.latitude);
    print(locations.longitude);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    );
  }
}