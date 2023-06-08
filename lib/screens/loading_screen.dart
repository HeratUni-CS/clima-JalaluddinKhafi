import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart';
import 'dart:convert';

String apiKey='4c5b86cf1ab33e8139ecd16a4bd5b30e';
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
    getPosition();
    getData();
  }


  void getPosition() async {
    location locations=location();
    await locations.getCurrentLocation();
    latitude=locations.latitude;
    longitude=locations.longitude;

  }
  void getData() async {
    Response response= await get('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey' as Uri);
    String data=response.body;
    if(response.statusCode==200){
      var decodedData=jsonDecode(data);

      double temperature=decodedData['main']['temp'];
      int condition =decodedData['weather'][0]['id'];
      String cityName=decodedData['name'];

     print(temperature);
     print(condition);
     print(cityName);
    }else{
   print(response.statusCode);
  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    );
  }
}