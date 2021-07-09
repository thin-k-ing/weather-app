import 'package:flutter/material.dart';
import 'package:weather_app/services/open_weather.dart';
import 'package:weather_app/pages/loading.dart';
import 'package:weather_app/pages/home.dart';

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.amberAccent,
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
          child: TextField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.lightBlueAccent,
              border: OutlineInputBorder(),
              labelText: 'City',
              labelStyle: TextStyle(
                fontFamily: 'Montserrat',
                // fontStyle: FontStyle.normal,
                letterSpacing: 3,
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            textCapitalization: TextCapitalization.words,
            controller: _controller,
            onSubmitted: (String value) async {
              Weather weather = Weather(city: value);

              try {
                await weather.getData();
                print(weather.info);
                Navigator.pop(context, {
                  'city' : weather.city,
                  'temp' : weather.temp,
                  'info' : weather.info,
                  'foreTemp': weather.foreTemp,
                  'feelsLike': weather.feelsLike,
                  'humidity': weather.humidity,
                  'windSpeed': weather.wind,
                  'windDeg': weather.windDeg,
                });
              } catch(e) {
                  await showDialog<void>(
                  context: context,
                  builder: (BuildContext context) {
                  return AlertDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                  actions: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Icon(
                        Icons.not_listed_location_outlined,
                        size: 50,
                        color: Colors.amberAccent,
                      ),
                      SizedBox(height: 20,),
                    ],
                  ),
                  ],
                  );
                  },
                  )
                  ;
              }
            },
          ),
        ),
      ),
    );

  }
}
