import 'dart:convert';

import 'package:flutter/material.dart';

class Forecast extends StatefulWidget {
  @override
  _ForecastState createState() => _ForecastState();
}

class _ForecastState extends State<Forecast> {

  Widget foreDetails(fore) {
    String temp = (fore['main']['temp'] - 273).toInt().toString() + ' ºC';
    return Expanded(
      child: Container(
        height: 50,
        width: 100,
        child: Card(
          color: Colors.amberAccent,
          child: Center(
            child: Text(
              temp,
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: Colors.white,
                fontSize: 25,
              ),
            ),
          ),
        ),
      ),
    );
  }
  List foreTemp = [];
  @override
  Widget build(BuildContext context) {
    foreTemp = ModalRoute.of(context)!.settings.arguments as List;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.amberAccent,
        title: Text(
          'Forecast Info',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: foreTemp.length,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
                  child: Container(
                    height: 60,
                    color: Colors.lightBlueAccent,
                    child: Row(
                      children: [
                        SizedBox(width: 10,),
                        Container(
                          height: 50,
                          width: 100,
                          child: Card(
                            color: Colors.amberAccent,
                            child: Center(
                              child: Text(
                              foreTemp[index]['dt_txt'].split(' ')[0].split('-')[2],
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                color: Colors.white,
                                fontSize: 25,
                              ),
                      ),
                            ),
                          ),
                        ),
                        foreDetails(foreTemp[index]),
                    ],
                    ),
                  ),
                ),
              ],
            );
          }
        ),
      ),
    );
  }
}
