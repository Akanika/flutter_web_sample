import 'package:flutter/material.dart';

import 'navigation_arrow.dart';

class ProjectsView extends StatelessWidget {
  late double screenWidth;
  late double screenHeight;
  ProjectsView({super.key});

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
          Text("I am Project View"),
          SizedBox(height: screenHeight * 0.05),
          infoText(),
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
    return const Stack(children: [
      NavigationArrow(isBackArrow: true),
      Center(child: Text("I am Project View"))
    ]);
  }

  Widget mobileView() {
    return Padding(
      padding: EdgeInsets.only(top: 100.0),
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

  // final ItemScrollController itemScrollController = ItemScrollController();
  // return Scaffold(
  //     appBar: AppBar(
  //       leading: IconButton(
  //         icon: const Icon(Icons.looks_4_rounded),
  //         onPressed: () => itemScrollController.scrollTo(
  //             index: 4, duration: const Duration(seconds: 1)),
  //       ),
  //     ),
  //     body: ScrollablePositionedList.builder(
  //         itemCount: 10,
  //         initialScrollIndex: 2,
  //         itemScrollController: itemScrollController,
  //         itemBuilder: (context, index) {
  //           return Center(
  //             heightFactor: 10,
  //             child: Text('$index'),
  //           );
  //         }));
}
