import 'package:flutter/material.dart';
import 'package:flutter_web_sample/navigation_arrow.dart';

class AboutView extends StatefulWidget {
  const AboutView({super.key});

  @override
  State<AboutView> createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  late double screenWidth;
  late double screenHeight;
  String loremIpsum =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus sed faucibus ex. Phasellus eget magna mi. Vestibulum vehicula viverra iaculis. Sed vehicula mattis arcu eu feugiat. Donec ultricies varius tellus, non maximus arcu blandit et. Sed semper, libero vitae semper dapibus, enim mauris bibendum elit, sit amet elementum eros nisl vitae enim. Morbi euismod, risus a aliquam lacinia, augue felis cursus sapien, sed aliquam enim diam in dolor. Proin id sagittis eros, ut egestas nisl.";

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 715) {
          return desktopView();
        } else {
          return mobileView();
        }
      },
    );
  }

  Widget infoSection() {
    return Container(
      width: screenWidth * 0.35,
      child: Column(
        children: [
          profilePicture(),
          SizedBox(height: screenHeight * 0.05),
          infoText()
        ],
      ),
    );
  }

  Widget profilePicture() {
    return Container(
      height: getImageSize(),
      width: getImageSize(),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(getImageSize() / 2),
        child: Container(
          color: Colors.grey,
          child: Center(child: Text('PLACEHOLDER IMAGE')),
        ),
      ),
    );
  }

  double getImageSize() {
    if (screenWidth > 1600 && screenHeight > 800) {
      return 350;
    } else if (screenWidth > 1300 && screenHeight > 600) {
      return 300;
    } else if (screenWidth > 1000 && screenHeight > 400) {
      return 200;
    } else {
      return 150;
    }
  }

  Widget infoText() {
    return const Text(
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus sed faucibus ex. Phasellus eget magna mi. Vestibulum vehicula viverra iaculis. Sed vehicula mattis arcu eu feugiat. Donec ultricies varius tellus, non maximus arcu blandit et. Sed semper, libero vitae semper dapibus, enim mauris bibendum elit, sit amet elementum eros nisl vitae enim. Morbi euismod, risus a aliquam lacinia, augue felis cursus sapien, sed aliquam enim diam in dolor. Proin id sagittis eros, ut egestas nisl.',
      overflow: TextOverflow.clip,
      style: const TextStyle(fontSize: 17),
    );
  }

  Widget desktopView() {
    return Stack(children: [
      NavigationArrow(isBackArrow: true),
      NavigationArrow(isBackArrow: false),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          infoSection(),
          SizedBox(width: screenHeight * 0.35),
        ],
      ),
    ]);
  }

  Widget mobileView() {
    return Padding(
      padding: const EdgeInsets.only(top : 50.0),
      child: Center(
        child: Column(
          children: [
            infoSection(),
            SizedBox(width: screenHeight * 0.35),
          ],
        ),
      ),
    );
  }
}
