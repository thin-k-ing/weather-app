import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  // a simple function returning a card widget
  // taking in property and value strings
  Widget createCard(String property, String value) {
    return Container(
      height: 100,
      width: 150,
      child: Card(
        elevation: 5,
        shadowColor: Colors.blue[900],
        color: Colors.lightBlueAccent,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                property,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
              Text(
                value,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 30,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    if(data.isEmpty)
      data = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        leading: IconButton(
          onPressed: () async {
              Map result = await Navigator.pushNamed(context, '/location') as Map;
              if(result.containsKey('windSpeed')) {
                setState(() {
                  data = result;
                });
              }
          },
          icon: Icon(
            Icons.search_outlined,
            size: 30,
          ),
          tooltip: 'Search Location',
        ),
        title: Text(
          data['city'],
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            letterSpacing: 2,
            fontSize: 35,
            fontFamily: 'Montserrat',
            // fontStyle: FontStyle.italic,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          SizedBox(height: 100),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  data['temp'].toString(),
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 40,
                    letterSpacing: 5,
                    color: Colors.lightBlueAccent,
                  ),
                ),
                SizedBox(width: 20),
                Text(
                  'ºC',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 50,
                    color: Colors.amberAccent,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30,),
          Text(
            data['info'],
            style: TextStyle(
              fontWeight: FontWeight.w100,
              fontFamily: 'Montserrat',
              fontSize: 30
            ),
          ),
          SizedBox(height: 30,),
          Center(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    createCard('Feels Like', data['feelsLike'].toString() + ' ºC'),
                    createCard('Humidity', data['humidity'].toString() + '%'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    createCard('Wind Speed', data['windSpeed'].toString() + ' m/s'),
                    createCard('Wind Angle', data['windDeg'].toString() + 'º'),
                  ],
                ),
              ],
            ),
          ),
      ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, '/forecast', arguments: data['foreTemp']);
        },
        label: Text(
          'Forecast',
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Montserrat',
          ),
        ),
        icon: Icon(Icons.arrow_forward_sharp, size: 30,),
        splashColor: Colors.lightBlue,
      ),
    );
  }
}
