import '../model/about_me.dart';
import 'package:flutter/material.dart';

Container circleIcon(AboutMe aboutMe, double size) {
  return Container(
    padding: const EdgeInsets.all(3),
    // width: size,
    // height: size,
    decoration: BoxDecoration(
      color: Colors.white,
      shape: BoxShape.circle,
    ),
    child: Icon(aboutMe.icon, size: size),
  );
}