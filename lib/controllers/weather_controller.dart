// ignore: unused_import
import 'dart:convert';
import 'package:http/http.dart' as http;
// ignore: unused_import
import 'package:weather_app/models/weather_model.dart';
 
class WeatherController {
  final WeatherModel weatherModel = WeatherModel();
  Future<void>fetchWeatherData(String city) async{
    const apikey = 'f997f4f2d1e1dbce2d9175da07caa664';
    final apiUrl = 'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apikey&units=metric'; 
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      print(result);
      // ignore: avoid_print
      print(result.toString());
      weatherModel.cityName = result['name'];
      weatherModel.temperature = result['main']['temp'].toString();
      weatherModel.iconUrl = 'http://openweathermap.org/img/w/${result['weather'][0]['icon']}.png';
    }
    else {
      throw Exception('failed to load the data');
    }
  }
}