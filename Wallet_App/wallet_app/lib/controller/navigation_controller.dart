import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_app/view/CardScreen/card_screen.dart';
import 'package:wallet_app/view/HistoryScreen/history_screen.dart';
import 'package:wallet_app/view/HomeScreen/home_screen.dart';
import 'package:wallet_app/view/more_screen.dart';

class NavigationController extends GetxController {
  /// USE RXINT TO MAKE SELECTEDINDEX OBSERVABLE
  var selectedIndex = 0.obs;

  /// LIST OF WIDGETS FOR THE BOTTOM NAVIGATION TABS
  final List<Widget> widgetList = const [
    HomeScreen(),
    HistoryScreen(),
    CardScreen(),
    MoreScreen()
  ];

  /// FUNCTION TO HANDLE TAP ON BOTTOM NAVIGATION ITEMS
  void onItemTapped(int index) {
    /// UPDATE THE OBSERVABLE VALUE
    selectedIndex.value = index;
  }
}
