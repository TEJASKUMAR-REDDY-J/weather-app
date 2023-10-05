import 'package:flutter/material.dart';
import 'package:weather_app/views/weather_view.dart';
import 'package:weather_app/controllers/weather_controller.dart';
// ignore: unused_import
import 'package:weather_app/models/weather_model.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final WeatherController controller = WeatherController();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WeatherScreen(controller: controller),
);
}
}