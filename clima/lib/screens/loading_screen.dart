import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/networking.dart';
import 'package:flutter/material.dart';
import 'package:clima/services/location.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const apiKey = '15550b2e11ee3155e5619de7ee51f91a';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();

    this.getLocationData();
  }

  Future getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(
        'https://samples.openweathermap.org/data/2.5/weather?lat=40&lon=110&appid=$apiKey');
    return await networkHelper.getData();
  }

  Future getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        'https://samples.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey');
    var weatherData = await networkHelper.getData();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => LocationScreen(
          locationWeather: weatherData,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitWave(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
