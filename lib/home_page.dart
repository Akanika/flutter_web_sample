import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_sample/about_view.dart';
import 'package:flutter_web_sample/bottom_bar.dart';
import 'package:flutter_web_sample/custom_tab.dart';
import 'package:flutter_web_sample/home_view.dart';
import 'package:flutter_web_sample/projects_view.dart';
import 'package:flutter_web_sample/tab_controller_handler.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'content_view.dart';
import 'custom_tab_bar.dart';
import 'navigation_arrow.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late ItemScrollController itemScrollController;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  late double screenHeight;
  late double screenWidth;
  late double topPadding;
  late double bottomPadding;
  late TabController tabController;
  List<ContentView> contentViews = [
    ContentView(tab: const CustomTab(title: 'Home'), content: const HomeView()),
    ContentView(
        tab: const CustomTab(title: 'About'), content: const AboutView()),
    ContentView(
        tab: const CustomTab(title: 'Projects'), content: ProjectsView())
  ];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: contentViews.length, vsync: this);
    itemScrollController = ItemScrollController();
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    topPadding = screenHeight * 0.05;
    bottomPadding = screenHeight * 0.01;
    return Scaffold(
        endDrawer: drawer(),
        key: scaffoldKey,
        body: Padding(
          padding: EdgeInsets.only(bottom: bottomPadding, top: topPadding),
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 715) {
                return desktopView();
              } else {
                return mobileView();
              }
            },
          ),
        ));
  }

  Widget desktopView() {
    return
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomTabBar(
            controller: tabController,
            tabs: contentViews.map((e) => e.tab).toList(),
          ),
          Container(
            height: screenHeight * 0.8,
            child: TabControllerHandler(
              tabController: tabController,
              child: TabBarView(
                controller: tabController,
                physics: AlwaysScrollableScrollPhysics(),
                children: contentViews.map((e) => e.content).toList(),
              ),
            ),
          ),
          const BottomBar()
        ],
      );
  }

  Widget mobileView() {
    return Padding(
      padding:
          EdgeInsets.only(left: screenWidth * 0.05, right: screenWidth * 0.05),
      child: Container(
        width: screenWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            IconButton(
              iconSize: screenWidth * 0.08,
              onPressed: () => scaffoldKey.currentState?.openEndDrawer(),
              icon: const Icon(Icons.menu_rounded),
              color: Colors.black,
            ),
            Expanded(
                child: ScrollablePositionedList.builder(
                    itemCount: contentViews.length,
                    itemScrollController: itemScrollController,
                    itemBuilder: (context, index) =>
                        contentViews[index].content))
          ],
        ),
      ),
    );
  }

  Widget drawer() {
    return Drawer(
      child: ListView(
        children: [Container(height: screenHeight * 0.1)] +
            contentViews
                .map((e) => Container(
                      child: ListTile(
                        title: Text(e.tab.title),
                        onTap: () {
                          itemScrollController.scrollTo(
                              index: contentViews.indexOf(e),
                              duration: Duration(milliseconds: 300));
                          Navigator.pop(context);
                        },
                      ),
                    ))
                .toList(),
      ),
    );
  }
}
