import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_sample/custom_icon_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: Container(
            height: 2,
            width: screenWidth * 0.9,
            color: Colors.black,
          ),
        ),
        Container(
          height: screenHeight * 0.05,
          child: Padding(
            padding: EdgeInsets.only(
                left: screenWidth * 0.05, right: screenWidth * 0.05),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CustomIconButton(
                        iconData: FontAwesomeIcons.youtube,
                        url:
                            "https://www.youtube.com/watch?v=jMLVg3bNd4I&list=PL0kMjh_O0eNcJDgS3Eglcc3hKeCA6a59K&index=4",
                        color: Colors.red),
                    SizedBox(width: screenWidth*0.021),
                    CustomIconButton(
                        iconData: FontAwesomeIcons.github, url: "https://github.com/Akanika/flutter_web_sample", color: Colors.black),
                    SizedBox(width: screenWidth*0.02),
                    CustomIconButton(iconData: FontAwesomeIcons.linkedin, url: "https://www.linkedin.com", color: Colors.blue)
                  ],
                ),
                Text('Made with Flutter Web \u00a9 2024', style: TextStyle(color: Colors.black),)
              ],
            ),
          ),
        )
      ],
    );
  }
}
