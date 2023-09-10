import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:smart_village/constant/colors.dart';
import 'package:smart_village/screen/widgets/agriculture_card.dart';
import 'package:smart_village/screen/widgets/educational_card.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<String> carouselTitle = [
    'স্মার্ট ভিলেজ',
    'স্মার্ট ভিলেজ',
    'স্মার্ট ভিলেজ'
  ];

  final List<String> carouselSubtTitle = [
    'প্রযুক্তির ছোয়া প্রতিটা গ্রামে',
    'স্মার্ট টেকনোলোজির প্রভাবে গ্রামীন জনজীবনের মান উন্নয়ন',
    'স্মার্ট টেকনোলোজির প্রভাবে গ্রামীন জনজীবনের মান উন্নয়ন'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        toolbarHeight: 80,
        elevation: 0,
        title: const Text(
          "স্মার্ট ভিলেজ",
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
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                // Color(0xffBCE2EE),
                Colors.blue,
                Colors.blueAccent,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              // begin: const FractionalOffset(0.0, 0.0),
              // end: const FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 5),
          child: ListView(
            children: [
              Container(
                height: 250,
                child: FlutterCarousel(
                  options: CarouselOptions(
                    height: 400.0,
                    autoPlay: true,
                    // viewportFraction: 0.9,
                    showIndicator: true,
                    slideIndicator: const CircularSlideIndicator(),
                  ),
                  items: [0, 1, 2].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Card(
                              clipBehavior: Clip.antiAlias,
                              child: Stack(
                                children: [
                                  Image.asset(
                                    "assets/vill - $i.jpg",
                                    fit: BoxFit.cover,
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: Container(
                                      padding: EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                          colors: [
                                            Colors.black.withOpacity(0.8),
                                            Colors.transparent
                                          ],
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            carouselTitle[i],
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            carouselSubtTitle[i],
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ));
                      },
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'জরুরী সেবাসমুহ',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const Row(
                children: [
                  EmergencyService(title: 'ফায়ার সার্ভিস'),
                  EmergencyService(title: 'পুলিশ'),
                  EmergencyService(title: 'হাসপাতাল'),
                ],
              ),
              const SizedBox(height: 10),
              const Text(
                'কৃষি সংক্রান্ত',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const AgricultureCard(
                title: "রোগ নির্ণয়",
                subtitle: 'আর্টিফিসিয়াল ইন্টেলিজেন্সের মাধ্যমে রোগ নির্ণয়',
              ),
              const SizedBox(height: 3),
              const AgricultureCard(
                title: "ফসল সংক্রান্ত টিপস",
                subtitle: 'প্রযুক্তির সাহায্যে ফসল সংক্রান্ত টিপস পাওয়া যাবে',
              ),
              const SizedBox(height: 3),
              const AgricultureCard(
                title: "মাটির গুনাগুন বিশ্লেষণ",
                subtitle: 'ছবির মাধ্যমে এলাকার মাটির গুনাগুন বিশ্লেষণ করা যাবে',
              ),
              const SizedBox(height: 10),
              const Text(
                'শিক্ষা সংক্রান্ত',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              const EducationalCard(
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
          )),
    );
  }
}

class EmergencyService extends StatelessWidget {
  final String title;
  const EmergencyService({
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 10),
      height: 60,
      width: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Card(
        color: primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 5,
        child: Center(
          child: Text(
            title,
            style: const TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }
}


// children: [
//                 const Text(
//                   '৩৪°',
//                   style: TextStyle(fontSize: 20),
//                 ),
