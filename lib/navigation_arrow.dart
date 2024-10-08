import 'package:flutter/material.dart';
import 'package:flutter_web_sample/tab_controller_handler.dart';

class NavigationArrow extends StatelessWidget {
  const NavigationArrow({Key? key, required this.isBackArrow})
      : super(key: key);

  final bool isBackArrow;

  @override
  Widget build(BuildContext context) {
    TabController? tabController =
        TabControllerHandler.of(context)?.tabController;
    return Padding(
      padding: isBackArrow
          ? EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.01)
          : EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.01),
      child: Align(
        alignment: isBackArrow ? Alignment.centerLeft : Alignment.centerRight,
        child: IconButton(
          onPressed: () => tabController?.animateTo(
              isBackArrow ? tabController.index - 1 : tabController.index + 1),
          icon: Icon(isBackArrow
              ? Icons.arrow_back_ios_rounded
              : Icons.arrow_forward_ios_rounded),
          color: Colors.black,
          splashColor: Colors.transparent,
        ),
      ),
    );
  }
}
