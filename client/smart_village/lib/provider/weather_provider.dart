// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WeatherProvider extends ChangeNotifier {
  double lat = 24.2299;
  double lon = 89.7122;
  static const String weatherApi = 'http://localhost:5124/api/Weather';

  Weather _weather = Weather(
    tempC: 0.0,
    humidity: 0.0,
    condition: '',
  );
  Weather get weather => _weather;

  Future<void> updateWeather() async {
    try {
      final response =
          await http.get(Uri.parse('$weatherApi?lat=${lat}&${lon}'));
      if (response.statusCode == 200) {
        Weather weather = Weather.fromJson(response.body);
        _weather = weather;
        print(weather.toString());
        notifyListeners();
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print(e);
    }
  }
}

class Weather {
  final double tempC;
  final double humidity;
  final String condition;
  Weather({
    required this.tempC,
    required this.humidity,
    required this.condition,
  });

  Weather copyWith({
    double? tempC,
    double? humidity,
    String? condition,
  }) {
    return Weather(
      tempC: tempC ?? this.tempC,
      humidity: humidity ?? this.humidity,
      condition: condition ?? this.condition,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tempC': tempC,
      'humidity': humidity,
      'condition': condition,
    };
  }

  factory Weather.fromMap(Map<String, dynamic> map) {
    return Weather(
      tempC: map['tempC'] as double,
      humidity: map['humidity'] as double,
      condition: map['condition'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Weather.fromJson(String source) =>
      Weather.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Weather(tempC: $tempC, humidity: $humidity, condition: $condition)';

  @override
  bool operator ==(covariant Weather other) {
    if (identical(this, other)) return true;

    return other.tempC == tempC &&
        other.humidity == humidity &&
        other.condition == condition;
  }

  @override
  int get hashCode => tempC.hashCode ^ humidity.hashCode ^ condition.hashCode;
}
