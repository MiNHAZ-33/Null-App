import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_village/provider/landing_provider.dart';

// ignore: must_be_immutable
class LandingPage extends StatelessWidget {
  LandingPage({super.key});

  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    var landingProvider = Provider.of<LandingProvider>(context);
    var index = landingProvider.currentIndex;

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            onPageChanged: (value) {
              value < 4 ? landingProvider.changeIndex(value) : null;
            },
            children: [
              Container(
                color: Colors.red,
                child: Image.asset("asset/images/1.png"),
              ),
              Container(
                color: Colors.green,
                child: Image.asset("asset/images/2.png"),
              ),
              Container(
                color: Colors.blue,
                child: Image.asset("asset/images/3.png"),
              ),
            ],
          ),
          Positioned(
              bottom: 50,
              left: 0,
              right: 0,
              child: DotsIndicator(
                dotsCount: 3,
                position: index,
              ))
        ],
      ),
    );
  }
}
