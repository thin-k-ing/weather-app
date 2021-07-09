import 'package:http/http.dart';
import 'dart:convert';
import 'package:weather_app/services/headtail.dart';
class Weather {
  String city;
  int temp = 300;
  int pressure = 0, wind = 0, windDeg = 0, feelsLike = 0, humidity = 0;
  List foreTemp = [];
  String info = 'default';
  Weather({this.city = 'Chennai'});

  Future<void> getData() async {
    Response responseCurrent = await get(Uri.parse(current(this.city)));
    Response responseForecast = await get(Uri.parse(forecast(this.city)));
    Map data = jsonDecode(responseCurrent.body);
    this.city = data['name'];
    this.temp = (data['main']['temp'] - 273.14).toInt();
    final details = data['weather'][0] as Map;
    this.info = details['main'];
    this.feelsLike = (data['main']['feels_like'] - 273.14).toInt();
    this.pressure = data['main']['pressure'];
    this.wind = data['wind']['speed'].toInt();
    this.windDeg = data['wind']['deg'].toInt();
    this.humidity = data['main']['humidity'];
    Map forecastData = jsonDecode(responseForecast.body);
    Map dayOne = forecastData['list'][3] as Map;
    foreTemp.add(dayOne);
    Map dayTwo = forecastData['list'][11] as Map;
    foreTemp.add(dayTwo);
    Map dayThree = forecastData['list'][19] as Map;
    foreTemp.add(dayThree);
    Map dayFour = forecastData['list'][27] as Map;
    foreTemp.add(dayFour);
    Map dayFive = forecastData['list'][35] as Map;
    foreTemp.add(dayFive);
  }
}