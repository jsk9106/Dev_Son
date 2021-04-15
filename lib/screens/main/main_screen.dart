import 'package:dev_son/responsive.dart';
import 'package:dev_son/screens/detail_contents/detail_contents.dart';
import 'package:dev_son/screens/introduction_menu/introduction_menu.dart';
import 'package:dev_son/screens/my_list/my_list.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Responsive(
        mobile: MyList(),
        tablet: Row(
          children: [
            Expanded(
              flex: 6,
              child: MyList(),
            ),
            Expanded(
              flex: 9,
              child: DetailContents(),
            ),
          ],
        ),
        desktop: Row(
          children: [
            // 좌측 메뉴
            Expanded(
              flex: _size.width > 1340 ? 2 : 4,
              child: IntroductionMenu(),
            ),
            // 리스트
            Expanded(
              flex: _size.width > 1340 ? 3 : 5,
              child: MyList(),
            ),
            // 디테일
            Expanded(
              flex: _size.width > 1340 ? 8 : 10,
              child: DetailContents(),
            ),
          ],
        ),
      ),
    );
  }
}
