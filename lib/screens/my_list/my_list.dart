import 'package:dev_son/components/title_and_subtitle.dart';
import 'package:dev_son/constants.dart';
import 'package:dev_son/controller/about_me_controller.dart';
import '../../model/about_me.dart';
import 'package:dev_son/responsive.dart';
import 'package:dev_son/screens/detail_contents/detail_contents.dart';
import 'package:dev_son/screens/introduction_menu/introduction_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../components/circle_icon.dart';

class MyList extends StatefulWidget {
  @override
  _MyListState createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 250),
        child: IntroductionMenu(),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          color: kBgDarkColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (!Responsive.isDesktop(context))
                    IconButton(
                      icon: Icon(Icons.menu),
                      onPressed: () {
                        _scaffoldKey.currentState!.openDrawer();
                      },
                    ),
                  Text(
                    "About Me",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: aboutMeList.length,
                  itemBuilder: (context, index) {
                    return _aboutMeCard(aboutMeList[index], index);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _aboutMeCard(AboutMe aboutMe, int index) {
    return Obx(
      () => InkWell(
        onTap: () {
          AboutMeController.to.changeAboutMe(aboutMe, index);
          if(Responsive.isMobile(context)) Get.to(() => DetailContents());
        },
        child: Container(
          margin: const EdgeInsets.only(bottom: 20),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          width: double.infinity,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Responsive.isMobile(context)
                ? kBgDarkColor
                : index == AboutMeController.to.cardIndex.value
                    ? kPrimaryColor
                    : kBgDarkColor,
            boxShadow: [kDefaultBoxShadow],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 아이콘, 제목, 부제목
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  circleIcon(aboutMe, 27),
                  SizedBox(width: 10),
                  titleAndSubTitle(context, aboutMe, 15, 11,
                      isActive: index == AboutMeController.to.cardIndex.value
                          ? true
                          : false),
                ],
              ),
              SizedBox(height: 10),
              Expanded(
                child: Text(
                  aboutMe.description,
                  style: TextStyle(
                    color: Responsive.isMobile(context)
                        ? kTextColor
                        : index == AboutMeController.to.cardIndex.value
                            ? Colors.white70
                            : kTextColor,
                    fontSize: 11,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
