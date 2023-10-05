import 'package:flutter/material.dart';
import 'package:weatherman/services/weather_data.dart';
import 'weatherpage.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key, required this.location}) : super(key: key);

  final String location;

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  //function that gets the weather
  void getWeather() async {
    WeatherData weather = WeatherData(location: widget.location);
    await weather.fetchData();

    if (context.mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) =>
              WeatherPage(locationData: weather.data),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    getWeather();
  }

  //the displayed contents of the loading screen
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: Center(
        child: Text(
          'Loading weather...',
          style: TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
