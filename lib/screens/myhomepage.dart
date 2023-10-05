import 'package:flutter/material.dart';
import 'loading_screen.dart';
// import 'weatherpage.dart';
// import '../weather_data.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //list of locations available to get weather data for
  List<String> locations = [
    'Kampala',
    'Nairobi',
    'Miami',
    'Sydney',
    'London',
    'Tokyo',
    'New York',
    'Los Angeles',
    'Paris',
    'Arua',
    'Gulu',
    'Lira',
    'Kabale',
    'Kasese',
    'Mbale',
    'Jinja',
    'Mbarara',
    'Masaka',
    'Fort Portal',
    'Hoima',
    'Soroti',
    'Tororo',
    'Entebbe',
    'Mukono',
    'Wakiso',
    'Masindi',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
        centerTitle: true,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const SizedBox(height: 10),
              const Text(
                'Select a location',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: locations.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: const Icon(Icons.cloud),
                      title: Text(locations[index]),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                //when the list tile is pressed, proceed to the data loading screen
                                //pass the name of the corresponding location
                                LoadingScreen(location: locations[index]),
                          ),
                        );
                      },
                    );
                  }, //itembuilder
                ),
              ),
            ],
          ),
        ),
      ),
    );
  } //build function
} //myhomepagestate