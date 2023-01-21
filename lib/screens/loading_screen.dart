import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:weather_app/services/location.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  late double latitude;
  late double longitude;
  int numberOfDaysToForecast = 7;
  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;
    print(latitude);
    print(longitude);
  }

  void getData() async {
    /* Response responseOfCurrentLocation = await get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=b13c35399d307a978a74281c4ea14d1e&units=metric'));
    print(responseOfCurrentLocation.body);*/
    Response responseOfCurrentLocationFor16Days = await get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/onecall?lat=$latitude&lon=$longitude&exclude=daily&appid=b13c35399d307a978a74281c4ea14d1e&units=metric'));
    print(responseOfCurrentLocationFor16Days.body);
  }

/*  @override
  void initState() {
    super.initState();
    getLocation();
  }*/

  @override
  Widget build(BuildContext context) {
    getLocation();
    getData();
    return Scaffold(
      body: TextField(),
    );
  }
}
