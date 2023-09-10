import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:smart_village/constant/colors.dart';
import 'package:smart_village/screen/landing_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  // Create an AnimationController
  late AnimationController _controller;
  // Create an Animation
  late Animation<double> _animation;

  @override
  void initState() {
    // Initialize the AnimationController
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
      lowerBound: 0.8, // The minimum value of the animation
      upperBound: 1, // The maximum value of the animation
    )..repeat(reverse: true); // Repeat the animation in reverse mode
    // Initialize the Animation with a curve
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    Timer(const Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LandingPage()),
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // Dispose the animation controller
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: primaryColor,
      body: Stack(
        children: [
          // The image widget that fills the entire screen
          ImageFiltered(
            imageFilter: ImageFilter.blur(sigmaX: 15.0, sigmaY: 15.0),
            child: Image.asset(
              "assets/splash.png",
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
          ),
          // The text widget that is aligned in the center
          Align(
            alignment: Alignment.center,
            child: ScaleTransition(
              scale: _animation,
              child: const Text(
                "স্মার্ট ভিলেজ",
                style: TextStyle(
                  color: Color.fromARGB(255, 18, 1, 62),
                  // color: primaryColor,
                  fontSize: 55,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
