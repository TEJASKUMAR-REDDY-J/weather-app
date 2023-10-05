import 'package:flutter/material.dart';
// ignore: unused_import
import '../controllers/weather_controller.dart';
// ignore: unused_import
import '../models/weather_model.dart';

class WeatherScreen extends StatefulWidget {
  final WeatherController controller;

  const WeatherScreen({super.key, required this.controller});

  @override
  // ignore: library_private_types_in_public_api
  _WeatherScreenState createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'Weather App',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 172, 33, 61), Color.fromARGB(255, 226, 64, 255)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.controller.weatherModel.cityName.isNotEmpty
                ? Column(
                    children: [
                      Image.network(
                        widget.controller.weatherModel.iconUrl,
                      ),
                      const SizedBox(height: 20.0),
                      Text(
                        'City: ${widget.controller.weatherModel.cityName}',
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16.0),
                      Text(
                        'Temperature: ${widget.controller.weatherModel.temperature}',
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 16.0),
                    ],
                  )
                : Container(),
            TextField(
              controller: cityController,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                labelText: 'Enter city name',
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                final city = cityController.text.trim();
                if (city.isNotEmpty) {
                  widget.controller.fetchWeatherData(city);
                  setState(() {});
                }
              },
              // ignore: sort_child_properties_last
              child: const Text(
                'Get Weather',
                style: TextStyle(fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.blue,
                backgroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              ),
            ),
          ],
        ),
     ),
);
}
}