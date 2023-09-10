import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_village/constant/colors.dart';
import 'package:smart_village/provider/landing_provider.dart';
import 'package:smart_village/screen/home_page.dart';

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
              print(value);
              value < 4
                  ? landingProvider.changeIndex(
                      value,
                    )
                  : null;
            },
            children: const [
              LandingCard(
                headingText: 'স্বাগতম',
                image: "assets/1.png",
                description:
                    'ডিজিটাল বাংলাদেশের স্মার্ট ভিলেজ প্রকল্পে স্বাগতম',
              ),
              LandingCard(
                  headingText: 'স্মার্ট ভিলেজ',
                  image: "assets/2.png",
                  description: 'স্মার্ট ভিলেজ প্রকল্পে আপনাকে স্বাগতম জানাই'),
              LandingCard(
                  headingText: 'এনায়েতপুর',
                  image: "assets/3.png",
                  description: 'এনায়েতপুর জেলার স্মার্ট ভিলেজে স্বাগতম'),
            ],
          ),
          Positioned(
              bottom: 8,
              right: 10,
              child: TextButton(
                onPressed: () {
                  // controller.navigateToAuth();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: const Text(
                  "স্কিপ",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: darkSecondaryColor),
                ),
              )),
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: DotsIndicator(
              dotsCount: 3,
              position: index,
              decorator: DotsDecorator(
                color: backgroundColor,
                activeColor: darkSecondaryColor,
                size: const Size.square(14.0),
                activeSize: const Size(20.0, 14.0),
                activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LandingCard extends StatelessWidget {
  final String headingText;
  final String description;
  final String image;

  const LandingCard(
      {required this.headingText,
      required this.description,
      required this.image,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: primaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              headingText,
              style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            Image.asset(image),
            Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
