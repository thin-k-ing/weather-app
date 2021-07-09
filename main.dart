// @dart=2.9
import 'package:flutter/material.dart';
import 'pages/loading.dart';
import 'pages/home.dart';
import 'pages/choose_location.dart';
import 'pages/forecast.dart';
void main() => runApp(MaterialApp(
  // initialRoute: '/',
  routes: {
    '/': (context) => Loading(),
    '/home': (context) => Home(),
    '/location': (context) => Location(),
    '/forecast': (context) => Forecast(),
  },
));
