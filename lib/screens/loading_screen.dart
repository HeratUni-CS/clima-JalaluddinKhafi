import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart';
class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getPosition();
    getData();
  }


  void getPosition() async {
    location locations=location();
    await locations.getCurrentLocation();
    print(locations.latitude);
    print(locations.longitude);

  }
  void getData() async {
    Response response= await get('https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid={API key}' as Uri);
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    );
  }
}