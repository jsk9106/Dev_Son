import '../model/about_me.dart';
import 'package:get/get.dart';

class AboutMeController extends GetxController{
  static AboutMeController get to => Get.find();
  Rx<AboutMe> aboutMe = aboutMeList[0].obs;
  RxInt cardIndex = 0.obs;

  void changeAboutMe(AboutMe getAboutMe, int index){
    aboutMe(getAboutMe);
    cardIndex(index);
    print(aboutMe.value.title);
  }
}