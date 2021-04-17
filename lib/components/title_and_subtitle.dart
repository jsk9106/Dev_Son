import '../model/about_me.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../responsive.dart';

Expanded titleAndSubTitle(BuildContext context, AboutMe aboutMe,
    double titleSize, double subTitleSize,
    {bool isActive = false}) {
  return Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          aboutMe.title,
          style: TextStyle(
            color: Responsive.isMobile(context)
                ? kTextColor
                : isActive
                    ? Colors.white70
                    : kTextColor,
            fontSize: titleSize,
            fontWeight: FontWeight.w600,
          ),
        ),
        aboutMe.subTitle.isNotEmpty
            ? Text(
                aboutMe.subTitle,
                style: TextStyle(
                  color: Responsive.isMobile(context)
                      ? kTextColor
                      : isActive
                          ? Colors.white70
                          : kTextColor,
                  fontSize: subTitleSize,
                ),
              )
            : Container(),
      ],
    ),
  );
}
