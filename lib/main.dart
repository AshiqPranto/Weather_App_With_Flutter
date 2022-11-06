import 'dart:convert';
import 'package:flutter/material.dart';
import 'data_service.dart';
import 'models.dart';

void main(){
  runApp(myApp());
}
class myApp extends StatefulWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  State<myApp> createState() => _myAppState();
}

class _myAppState extends State<myApp> {

  final _cityTextController = TextEditingController();
  final _dataService = DataService();

  WeatherResponse? _response;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Weather App",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Weather App",),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //for if code will add later
              if(_response!=null)
                Column(
                  children: [
                    // Image.network(_response?.iconUrl),
                    Text(
                      '${_response?.temperature}',
                      style: TextStyle(fontSize: 40),
                    ),
                    Text('${_response?.weatherInfo.description}'),

                  ],
                ),
              Padding(padding: EdgeInsets.symmetric(vertical: 50),
              child: SizedBox(
                width: 200,
                child: TextField(
                  controller: _cityTextController,
                  decoration: InputDecoration(labelText: 'City'),
                  textAlign: TextAlign.center,
                ),
              ),
              ),
              ElevatedButton(onPressed: _search, child: Text('Search'))
            ],
          ),
        ),
      ),
    );
  }
  void _search() async {
    final response = await _dataService.getWeather(_cityTextController.text);
    setState(() {
      _response = response;
    });
    // print(response.cityName);
    // print(response.temperature);
    // print(response.weatherInfo.description);
    // print(response.weatherInfo.icon);

  }
}
