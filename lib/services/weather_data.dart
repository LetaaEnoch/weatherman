import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherData {
  final String location;
  late Map data;

  //constructor for the WeatherData class
  WeatherData({required this.location});

  //function to fetch weather data from the api (in json format)
  Future<void> fetchData() async {
    final String apiUrl =
        'http://api.weatherapi.com/v1/current.json?key=308ec91b40034da0ac0202747230410&q=$location&aqi=no';

    try {
      final response = await http.get(Uri.parse(apiUrl));
      data = jsonDecode(response.body);
    } catch (e) {
      throw Exception('Failed to load weather data');
    }
  }
}
