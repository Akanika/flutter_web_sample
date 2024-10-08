import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_sample/navigation_arrow.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late double screenWidth;
  late double screenHeight;
  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 715) {
        return desktopView();
      } else {
        return mobileView();
      }
    });
  }

  Widget header(double fontSize) {
    return RichText(
        text: TextSpan(
            style: TextStyle(color: Colors.black, fontSize: fontSize),
            children: <TextSpan>[
          TextSpan(text: 'Hi, my name is '),
          TextSpan(text: 'Alisha', style: TextStyle(color: Color(0xff21a179))),
          TextSpan(text: '!')
        ]));
  }

  Widget subHeader(String text, double fontSize) {
    return Text(text,
        style: TextStyle(color: Colors.grey[500], fontSize: fontSize));
  }

  Widget picture() {
    return Container(
      height: getImagesSize(),
      width: getImagesSize(),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(getImagesSize() / 2),
        child: Image.asset(
          'assets/picture.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget desktopView() {
    return Stack(children: [
      NavigationArrow(isBackArrow: false),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: screenWidth * 0.45,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header(getFontSize(true)),
                SizedBox(height: screenHeight * 0.05),
                subHeader('Computer Scientist', getFontSize(false)),
                SizedBox(height: screenHeight * 0.01),
                subHeader('App Developer', getFontSize(false)),
                SizedBox(height: screenHeight * 0.01),
                subHeader('Flutter Enthusiastic', getFontSize(false)),
                SizedBox(height: screenHeight * 0.1),
              ],
            ),
          ),
          SizedBox(width: screenWidth * 0.03),
          picture()
        ],
      ),
    ]);
  }

  Widget mobileView() {
    return Column(
      children: [
        picture(),
        SizedBox(height: screenHeight * 0.02),
        header(30),
        SizedBox(height: screenHeight * 0.01),
        subHeader(
            'Computer Scientist - App Developer - Flutter Enthusiastic ', 15),
      ],
    );
  }

  double getImagesSize() {
    if (screenWidth > 1600 && screenHeight > 800) {
      return 400;
    }
    if (screenWidth > 1300 && screenHeight > 600) {
      return 350;
    }
    if (screenWidth > 1000 && screenHeight > 400) {
      return 300;
    } else {
      return 250;
    }
  }

  double getFontSize(bool isHeader) {
    double fontSize = screenWidth > 950 && screenHeight > 550 ? 30 : 25;
    return isHeader ? fontSize * 2.25 : fontSize;
  }
}
