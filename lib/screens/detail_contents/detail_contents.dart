import 'package:cached_network_image/cached_network_image.dart';
import 'package:dev_son/components/circle_icon.dart';
import 'package:dev_son/components/title_and_subtitle.dart';
import 'package:dev_son/constants.dart';
import 'package:dev_son/controller/about_me_controller.dart';
import 'package:dev_son/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailContents extends GetView<AboutMeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          padding: Responsive.isMobile(context)
              ? const EdgeInsets.fromLTRB(20, 0, 20, 10)
              : const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Obx(
            () => SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (!Responsive.isMobile(context)) ...[
                    Row(
                      children: [
                        circleIcon(controller.aboutMe.value, 35),
                        SizedBox(width: 10),
                        titleAndSubTitle(
                            context, controller.aboutMe.value, 20, 15),
                      ],
                    ),
                    SizedBox(height: 20),
                  ] else
                    _buildAppBar(context),
                  Text(
                    controller.aboutMe.value.description,
                    style: TextStyle(
                      color: kTextColor,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 40),
                  textAndCode(),
                  Divider(height: 20, thickness: 1),
                  attachedSection(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row textAndCode() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${controller.aboutMe.value.imageList.length} attachments',
        ),
        if (controller.aboutMe.value.link.isNotEmpty)
          InkWell(
            onTap: () => launch(controller.aboutMe.value.link),
            child: Row(
              children: [
                Icon(MdiIcons.github),
                SizedBox(width: 5),
                Text('code'),
              ],
            ),
          )
      ],
    );
  }

  // Widget attachedSection() {
  //   return SizedBox(
  //     height: 400,
  //     child: StaggeredGridView.countBuilder(
  //       // scrollDirection: Axis.horizontal,
  //       physics: BouncingScrollPhysics(),
  //       crossAxisCount: 4,
  //       itemCount: controller.aboutMe.value.imageList.length,
  //       itemBuilder: (BuildContext context, int index) => ClipRRect(
  //         borderRadius: BorderRadius.circular(8),
  //         child: Image.asset(
  //           controller.aboutMe.value.imageList[index],
  //           fit: BoxFit.cover,
  //         ),
  //       ),
  //       staggeredTileBuilder: (int index) => StaggeredTile.count(
  //         2,
  //         index.isOdd ? 2 : 1,
  //       ),
  //       mainAxisSpacing: 20,
  //       crossAxisSpacing: 20,
  //     ),
  //   );
  // }

  Widget attachedSection() {
    return controller.aboutMe.value.imageList.length != 0
        ? Container(
            margin: const EdgeInsets.only(top: 10),
            height: Get.size.height * 0.38,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemCount: controller.aboutMe.value.imageList.length,
              itemBuilder: (context, index) =>
                  imageCard(controller.aboutMe.value.imageList[index]),
            ),
          )
        : Container();
  }

  Widget imageCard(String image) {
    return Container(
      width: Get.size.height * 0.38,
      margin: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: AssetImage(image),
          // image: Image.network(image).image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () => Get.back(),
          ),
          titleAndSubTitle(context, controller.aboutMe.value, 20, 15),
          circleIcon(controller.aboutMe.value, 30),
        ],
      ),
    );
  }
}
