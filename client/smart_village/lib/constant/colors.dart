import 'package:flutter/material.dart';

const Color backgroundColor = Color(0xffE5D9B6);
// const Color backgroundColor = Color(0xffE5D9B6);
// const Color primaryColor = Color(0xff285430);
const Color primaryColor = Color(0xff1450A3);
const Color secondaryColor = Color(0xffA4BE7B);
const Color darkSecondaryColor = Color(0xff5F8D4E);

var bgGradient = const LinearGradient(
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
);
