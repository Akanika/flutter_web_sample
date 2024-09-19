import 'package:flutter/cupertino.dart';
import 'package:flutter_web_sample/custom_tab.dart';

class ContentView{
  ContentView({required this.tab, required this.content});

  final CustomTab tab;
  final Widget content;
}