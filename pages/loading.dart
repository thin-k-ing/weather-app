import 'package:flutter/material.dart';
import 'package:weather_app/services/open_weather.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_spinkit/flutter_spinkit.dart';
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  Weather weather = Weather(city: 'Patna');
  void setWeather() async {
    await weather.getData();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'city' : weather.city,
      'temp' : weather.temp,
      'info' : weather.info,
      'foreTemp': weather.foreTemp,
      'feelsLike': weather.feelsLike,
      'humidity': weather.humidity,
      'windSpeed': weather.wind,
      'windDeg': weather.windDeg,
    });
  }

  @override
  void initState() {
    super.initState();
    setWeather();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/weather_img.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Open Weather',
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.lightBlueAccent,
                  fontFamily: 'Montserrat',
                  fontStyle: FontStyle.normal,
                ),
              ),
              SizedBox(height: 20,),
              SpinKitChasingDots(
                color: Colors.amberAccent,
                size: 50.0,
              ),
            ],
          ),
        ),
    );
  }
}
