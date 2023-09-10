import 'package:flutter/material.dart';

import '../constant/colors.dart';
import 'widgets/educational_card.dart';

class OnlineClassPage extends StatelessWidget {
  const OnlineClassPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          centerTitle: true,
          toolbarHeight: 80,
          elevation: 0,
          title: const Text(
            "অনলাইন ক্লাস",
            style: TextStyle(fontSize: 25),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_active,
                // color: Colors.yellow,
              ),
            )
          ],
        ),
        body: Container(
          height: double.maxFinite,
          width: double.maxFinite,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          decoration: BoxDecoration(
            gradient: bgGradient,
          ),
          child: ListView(
            children: [
              const SizedBox(height: 10),
              const EducationalCard(
                  title: '্ক্লাস ১-১২',
                  subtitle: 'অভিজ্ঞ শিক্ষকের মাধ্যমে অনলাইনে পাঠদান'),
              const SizedBox(height: 3),
              const EducationalCard(
                  title: 'স্কিল ডেভেলপমেন্ট',
                  subtitle: ' এক্সপার্ট দ্বারা স্কিল ডেভেলপমেন্ট কোর্স'),
              const SizedBox(height: 3),
              const EducationalCard(
                  title: ' ট্রেইনিং',
                  subtitle: ' বাস্তব ও কর্মমূখী ট্রেইনিং প্রদান'),
            ],
          ),
        ));
  }
}
