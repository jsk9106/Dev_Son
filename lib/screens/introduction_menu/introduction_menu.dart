import 'package:dev_son/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../constants.dart';

class IntroductionMenu extends StatelessWidget {
  const IntroductionMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      color: kBgLightColor,
      height: Get.size.height,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(radius: 30),
                  Spacer(),
                  if(!Responsive.isDesktop(context)) CloseButton(),
                ],
              ),
              SizedBox(height: 15),
              Text(
                '현실의 문제를 해결하는 개발자 손진수입니다.',
                style: TextStyle(
                  color: kTextColor,
                  fontSize: 13,
                ),
              ),
              SizedBox(height: 50),
              Text(
                'Contact & Channel',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              _buildChannelButton('Github', MdiIcons.github, () {}),
              _buildChannelButton('Instargram', MdiIcons.instagram, () {}),
              _buildChannelButton('E-mail', MdiIcons.gmail, () {})
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildChannelButton(String text, IconData iconData, GestureTapCallback press) {
    return InkWell(
      onTap: press,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.black.withOpacity(0.1), width: 0.1),
          ),
        ),
        child: Row(
          children: [
            Icon(iconData, color: kGrayColor),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                text,
                style: TextStyle(color: kTextColor, fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
