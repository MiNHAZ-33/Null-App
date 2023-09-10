// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../educational_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final drawerOptions = [
      'শিক্ষা ও দক্ষতা উন্নয়ন',
      'কৃষিকাজ',
      'স্বাস্থ্যসেবা',
      'মার্কেটপ্লেস',
      'ডিজিটাল গভার্নেন্স সার্ভিস',
      'অভিযোগ ও মতামত',
      'পুনঃনবায়ন যোগ্য শক্তি',
      ' ডিজিটাল পরিবহণ ব্যবস্থা',
      'গ্রামীন উদ্যোক্তা ও আর্থিক উন্নয়ন',
      'আনুষ্ঠানিক ও সাংস্কৃতিক কর্মসূচি',
      'অবকাঠামোগত উন্নয়ন',
    ];
    const bgColor = Color.fromARGB(255, 18, 42, 68);

    return Drawer(
      elevation: 0,
      width: MediaQuery.of(context).size.width * .6,
      child: Column(
        children: [
          Container(
            height: 120,
            color: bgColor,
            padding: const EdgeInsets.only(top: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 80,
                      width: 80,
                      child: Image.asset(
                        'assets/weather/night.jpg',
                        fit: BoxFit.contain,
                      ),
                    ),
                    const Text(
                      '২৮° সেঃ',
                      style: TextStyle(color: Colors.white70, fontSize: 25),
                    )
                  ],
                ),
              ],
            ),
          ),
          const Divider(
            height: 10,
            thickness: 10,
          ),
          DrawerItem(
              title: drawerOptions[0],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EducationalPage(),
                  ),
                );
              }),
          DrawerItem(title: drawerOptions[1], onTap: () {}),
          DrawerItem(title: drawerOptions[2], onTap: () {}),
          DrawerItem(title: drawerOptions[3], onTap: () {}),
          DrawerItem(title: drawerOptions[4], onTap: () {}),
          DrawerItem(title: drawerOptions[5], onTap: () {}),
          DrawerItem(title: drawerOptions[6], onTap: () {}),
          DrawerItem(title: drawerOptions[7], onTap: () {}),
          DrawerItem(title: drawerOptions[8], onTap: () {}),
          DrawerItem(title: drawerOptions[9], onTap: () {}),
          DrawerItem(title: drawerOptions[10], onTap: () {}),
        ],
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final String title;
  final Function onTap;
  const DrawerItem({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Card(
        child: ListTile(
          title: Text(title),
        ),
      ),
    );
  }
}
