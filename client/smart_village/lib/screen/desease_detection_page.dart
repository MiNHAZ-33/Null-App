import 'package:flutter/material.dart';
import 'package:smart_village/constant/colors.dart';

class DiseaseDetectionPage extends StatelessWidget {
  const DiseaseDetectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        centerTitle: true,
        toolbarHeight: 80,
        elevation: 0,
        title: const Text(
          "রোগ নির্ণয়",
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
        decoration: BoxDecoration(gradient: bgGradient),
        child: Center(child: Icon(Icons.camera_alt, size: 100)),
      ),
    );
  }
}
