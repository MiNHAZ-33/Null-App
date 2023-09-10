import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final drawerOptions = [
      'শিক্ষা ও দক্ষতা উন্নয়ন',
      'কৃষিকাজ',
      'স্বাস্থ্যসেবা',
      'মার্কেটপ্লেস',
      'অভিযোগ ও মতামত'
    ];
    const bgColor = Color.fromARGB(255, 18, 42, 68);

    return Drawer(
        elevation: 0,
        width: MediaQuery.of(context).size.width * .6,
        child: Column(children: [
          Container(
            height: 120,
            color: bgColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                    Text(
                      '34°C',
                      style:
                          GoogleFonts.lato(color: Colors.white70, fontSize: 25),
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
          for (var title in drawerOptions)
            InkWell(
              onTap: () {},
              child: Card(
                child: ListTile(
                  title: Text(title),
                ),
              ),
            )
        ]));
  }
}