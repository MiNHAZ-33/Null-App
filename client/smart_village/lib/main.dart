import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_village/provider/weather_provider.dart';

import 'provider/landing_provider.dart';
import 'screen/splash_screen..dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LandingProvider()),
        ChangeNotifierProvider(create: (_) => WeatherProvider()),
      ],
      child: const MaterialApp(
        title: 'স্মার্ট ভিলেজ',
        debugShowCheckedModeBanner: false,
        // theme: ThemeData(
        //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        //   useMaterial3: true,
        // ),
        home: SplashScreen(),
      ),
    );
  }
}
