import 'package:flutter/material.dart';
// import 'package:http/http.dart';
// import '../weather_data.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({Key? key, required this.locationData}) : super(key: key);
  final Map locationData;

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  Map countryCodes = {
    'Uganda': 'UG',
    'Kenya': 'KE',
    'United States': 'US',
    'Australia': 'AU',
    'United Kingdom': 'GB',
    'Japan': 'JP',
    'France': 'FR',
  };
  late Image flag;
  @override
  void initState() {
    super.initState();
    countryCodes.forEach((key, value) {
      if (widget.locationData['location']['country'] == key) {
        flag = Image.network('https://flagsapi.com/$value/flat/64.png');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 167, 95, 95),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            flag,
            Text(
              '${widget.locationData['location']['name']}, ${widget.locationData['location']['country']}',
              style: const TextStyle(fontSize: 35),
              textAlign: TextAlign.center,
            ),
            Text(
              widget.locationData['current']['condition']['text'],
              style: const TextStyle(fontSize: 30),
              textAlign: TextAlign.center,
            ),
            Text(
              '${widget.locationData['current']['temp_c'].toString()}\u00B0C',
              style: const TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
