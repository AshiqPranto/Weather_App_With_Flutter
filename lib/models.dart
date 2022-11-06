/*
We don't need all the data from api response.
{
  "weather": [
    {
      "description": "moderate rain",
      "icon": "10d"
    }
  ],
  "main": {
    "temp": 298.48,
  },
  "name": "Zocca",
}
 */
class WeatherInfo{
  final String description;
  final String icon;

  WeatherInfo({required this.description,required this.icon});

  factory WeatherInfo.fromjson(Map<String,dynamic> json){
    final descriptionValue = json['description'];
    final iconValue = json['icon'];

    return WeatherInfo(description: descriptionValue, icon: iconValue);

  }

}

class TemperatureInfo{
  final double temperature;

  TemperatureInfo({required this.temperature});

  factory TemperatureInfo.fromjson(Map<String,dynamic> json){
    final temperatureValue = json['temp'];
    return TemperatureInfo(temperature: temperatureValue);
  }

}

class WeatherResponse{
  final String cityName;
  final double temperature;
  final WeatherInfo weatherInfo;

  String? get iconUrl{
    return 'http://openweathermap.org/img/wn/${weatherInfo.icon}@2x.png';
  }

  WeatherResponse({required this.cityName,required this.temperature, required this.weatherInfo});

    factory WeatherResponse.fromjson(Map<String,dynamic> json){
    final cityNameValue = json['name'];

    TemperatureInfo temperatureInfo = TemperatureInfo.fromjson(json['main']);

    WeatherInfo weatherInfoValue = WeatherInfo.fromjson(json['weather'][0]);

    return WeatherResponse(cityName: cityNameValue,temperature: temperatureInfo.temperature,weatherInfo: weatherInfoValue);
  }

}