import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AboutMe {
  final String title;
  final String subTitle;
  final IconData icon;
  final String description;
  final List<String> imageList;
  final String link;

  AboutMe({
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.description,
    required this.imageList,
    required this.link,
  });
}

List<AboutMe> aboutMeList = [
  AboutMe(
    title: 'Introduction',
    subTitle: '',
    icon: Icons.person,
    description: '* 안녕하세요! Flutter 개발자 손진수입니다.'
        '\n* 개발자가 되기 전 축구선수 생활을 하다가 지금은 개발에 푹 빠져있습니다.'
        '\n* 무엇보다 꾸준함의 진짜 가치를 알기에 하루 7시간 이상 꾸준히 코딩을 하고 있습니다.'
        '\n* 안되던걸 끝까지 파고들어 해냈을 때 희열을 느낍니다.'
        '\n* 개인 프로젝트를 진행할 때 새로운 태크닉을 적용하는 것과 Refactoring에 많은 시간을 투자합니다.'
        '\n* 책과 창업, 꾸준히 발전하는 것에 관심이 많습니다.',
    imageList: [
      'images/introduction/001.png',
    ],
    link: '',
  ),
  AboutMe(
    title: 'Skills',
    subTitle: '',
    icon: MdiIcons.codeTags,
    description: 'Backend'
        '\n* Dart, PHP'
        '\n* Flutter'
        '\n* Android Studio, Visual Studio Code, Atom'
        '\n* Git, Github'
        '\n\nDevOps'
        '\n* Mysql'
        '\n* Firebase'
        '\n\nFrontend'
        '\n* HTML5'
        '\n* CSS3'
        '\n* JavaScript',
    imageList: createPath(12, 'skills'),
    link: '',
  ),
  AboutMe(
    title: 'Go강릉',
    subTitle: 'project',
    icon: MdiIcons.airplane,
    description: '''
* 한국관광공사에서 제공한 API를 활용한 Flutter App
* 여자친구와의 데이트 코스를 고민하는게 힘들어서 기획한 앱
* 강원도 강릉시의 관광지, 맛집, 축제 정보를 제공
* Google Map으로 위치정보 제공
* SQLite 활용해서 즐겨찾기 기능 구현
* Google Play Store 배포 하기위해 열심히 개발중
* 공공 API를 처음으로 활용한 경험''',
    imageList: createPath(9, 'go_gangneung'),
    link: 'https://github.com/jsk9106/GO_Gangneung',
  ),
  AboutMe(
    title: 'Flutter Movie App',
    subTitle: 'project',
    icon: MdiIcons.movie,
    description: '''
* The Movie Database에서 제공하는 API를 활용해 만든 Flutter Movie App
* 인기영화의 정보와 평점 등을 보여주는 앱
* FIrebase와 연동하여 Review기능을 만듬
* Google Login''',
    imageList: createPath(8, 'flutter_movie_app'),
    link: 'https://github.com/jsk9106/Flutter_Movie_with_tmdb',
  ),
  AboutMe(
    title: 'Flutter Weather App',
    subTitle: 'project',
    icon: MdiIcons.weatherNight,
    description: '''
* Open Weather Map에서 제공하는 API를 활용한 Flutter Weather App
* My Location 패키지로 현재 위치정보 확인
* 현재 위치정보로 날씨 정보 확인
* 날씨 정보에 따라 옷차림 추천
* Future asynk await에 대한 이해를 하는데 많은 도움이 된 프로젝트''',
    imageList: createPath(9, 'flutter_weather_app'),
    link: 'https://github.com/jsk9106/Flutter-Weather-App',
  ),
  AboutMe(
    title: '이에이커 Web',
    subTitle: 'project',
    icon: MdiIcons.soccer,
    description: '''
* 이에이커( 2ac 축구장 면적의 크기)
* 유소년 축구팀 홍보 및 연습경기 매치 플랫폼
* 생활코딩을 보고 배운 PHP로 만든 개발자 인생 첫 번째 프로젝트
* 그누보드를 활용
* Mysql DB 연동
* 실제 배포까지 완료(네이버에 이에이커 검색)
* 기획 단계에서부터 배포까지 전반적인 프로세스를 경험
* 약 200개 팀에 연락해 서비스를 알렸지만 2개 팀만 가입한 실패 경험''',
    imageList: createPath(1, 'eacre_web', extension: 'jpg'),
    link: 'http://whistle4u.com',
  ),
  AboutMe(
    title: '이에이커 App',
    subTitle: 'project',
    icon: MdiIcons.soccer,
    description: '''
* 웹으로 만든 이에이커 아이디어를 앱으로 재현한 프로젝트
* 유소년 축구팀 연습경기 매치 앱
* Firebase 연동
* Google, Facebook 로그인
* StreamBuilder를 활용한 타임라인 형식의 매치글
* Infinity Scroll
* 처음으로 채팅 기능과 푸시알림 기능을 구현한 경험
* 다수의 쿼리 튜닝 경험''',
    imageList: createPath(11, 'eacre_app'),
    link: 'https://github.com/jsk9106/Flutter-Earce',
  ),
];

List<String> createPath(int num, String folder, {String extension = 'png'}){
  List<String> pathList = [];
  String _path;

  for(var i = 1; i < num + 1; i++){
    if(i.toString().length == 1){
      _path = '00$i';
    } else{
      _path = '0$i';
    }
    pathList.add('assets/images/$folder/$_path.$extension');
  }
  return pathList;
}
