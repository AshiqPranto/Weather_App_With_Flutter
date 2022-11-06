import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app_with_flutter/models.dart';

class DataService{
  Future<WeatherResponse> getWeather(String cityName) async{

    final queryParameters = {
      'q': cityName,
      'appid': '476d7f2559919d457197305729d0b1aa',
      'units': 'imperial'
    };
    //https://api.openweathermap.org/data/2.5/weather?q={city name}&appid={API key}

    final uri  = Uri.https('api.openweathermap.org', '/data/2.5/weather',queryParameters);
    final response = await http.get(uri);

    final json = jsonDecode(response.body);
    // print(response.body);
    return WeatherResponse.fromjson(json);

  }
}