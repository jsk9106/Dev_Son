import 'package:flutter/material.dart';

class AboutMe {
  final String title;
  final String subTitle;
  final IconData icon;
  final String description;
  final List<String> imageList;

  AboutMe({
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.description,
    required this.imageList,
  });
}

List<AboutMe> aboutMeList = [
  AboutMe(
    title: 'Introduction',
    subTitle: '',
    icon: Icons.person,
    description:
        '\n* 안녕하세요! 6개월 차 Flutter 개발자 손진수입니다.'
        '\n* 개발자가 되기 전 축구선수 생활을 하다가 지금은 개발에 푹 빠져있습니다.'
        '\n* 무엇보다 꾸준함의 진짜 가치를 알기에 하루 7시간 이상 꾸준히 코딩을 하고 있습니다.'
        '\n* 안되던걸 끝까지 파고들어 해냈을 때 희열을 느낍니다.'
        '\n* 개인 프로젝트를 진행할 때 새로운 태크닉을 적용하는 것과 Refactoring에 많은 시간을 투자합니다.'
        '\n* 책과 창업, 꾸준히 발전하는 것에 관심이 많습니다.',
    imageList: [
      'assets/images/img_0.png',
      'assets/images/img_1.png',
      'assets/images/img_2.png',
    ],
  ),
  AboutMe(
    title: 'test',
    subTitle: 'test',
    icon: Icons.person,
    description: '현실의 문제를 해결하는 개발자 손진수입니다.'
        '* 안녕하세요! 6개월 차 Flutter 개발자 손진수입니다.'
        '* 개발자가 되기 전 축구선수 생활을 하다가 지금은 개발에 푹 빠져있습니다.'
        '* 무엇보다 꾸준함의 진짜 가치를 알기에 하루 7시간 이상 꾸준히 코딩을 하고 있습니다.'
        '* 안되던걸 끝까지 파고들어 해냈을 때 희열을 느낍니다.'
        '* 개인 프로젝트를 진행할 때 새로운 태크닉을 적용하는 것과 Refactoring에 많은 시간을 투자합니다.'
        '* 책과 창업, 꾸준히 발전하는 것에 관심이 많습니다.',
    imageList: [
      'assets/images/img_0.png',
      'assets/images/img_1.png',
      'assets/images/img_2.png',
    ],
  ),
];
