import 'package:dev_son/components/circle_icon.dart';
import 'package:dev_son/components/title_and_subtitle.dart';
import 'package:dev_son/constants.dart';
import 'package:dev_son/controller/about_me_controller.dart';
import 'package:dev_son/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class DetailContents extends GetView<AboutMeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Responsive.isMobile(context)
          ? AppBar(
              backgroundColor: Colors.white,
              toolbarHeight: Get.size.height * 0.1,
              elevation: 0,
              title: Text(
                controller.aboutMe.value.title,
                style: TextStyle(
                  color: kTextColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                onPressed: () => Get.back(),
              ),
            )
          : null,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          padding: Responsive.isMobile(context)
              ? const EdgeInsets.fromLTRB(20, 0, 20, 10)
              : const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          color: Colors.white,
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                if (!Responsive.isMobile(context)) ...[
                  Row(
                    children: [
                      circleIcon(controller.aboutMe.value, 40),
                      SizedBox(width: 10),
                      titleAndSubTitle(context, controller.aboutMe.value, 20, 15),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
                Text(
                  controller.aboutMe.value.description,
                  style: TextStyle(
                      color: kTextColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w200),
                ),
                SizedBox(height: 40),
                Text('${controller.aboutMe.value.imageList.length} attachments'),
                Divider(height: 20, thickness: 1),
                SizedBox(
                  height: Get.size.height * 0.6,
                  child: StaggeredGridView.countBuilder(
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 4,
                    itemCount: controller.aboutMe.value.imageList.length,
                    itemBuilder: (BuildContext context, int index) => ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        controller.aboutMe.value.imageList[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                    staggeredTileBuilder: (int index) => StaggeredTile.count(
                      2,
                      index.isOdd ? 2 : 1,
                    ),
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
