import 'package:flutter/material.dart';

import '../constant/colors.dart';
import 'online_class_page.dart';
import 'widgets/educational_card.dart';

class EducationalPage extends StatelessWidget {
  const EducationalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          centerTitle: true,
          toolbarHeight: 80,
          elevation: 0,
          title: const Text(
            "শিক্ষা সংক্রান্ত",
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
               EducationalCard(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OnlineClassPage(),
                      ),
                    );
                  },
                  title: 'অনলাইন ক্লাস',
                  subtitle: 'অভিজ্ঞ শিক্ষকের মাধ্যমে অনলাইনে পাঠদান'),
              const SizedBox(height: 3),
              const EducationalCard(
                  title: 'ই-বুক কালেকশন',
                  subtitle: 'বিভিন্ন বিষয়ের ই-বুক পাওয়া যাবে'),
              const SizedBox(height: 3),
              const EducationalCard(
                  title: 'শিক্ষনীয় রিসোর্স',
                  subtitle: 'শিক্ষনীয় রিসোর্স পাওয়া যাবে'),
            ],
          ),
        ));
  }
}
