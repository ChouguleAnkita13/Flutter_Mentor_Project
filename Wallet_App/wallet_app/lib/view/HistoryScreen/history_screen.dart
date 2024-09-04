import 'package:flutter/material.dart';
import 'package:wallet_app/view/HistoryScreen/Widgets/history.dart';
import 'package:wallet_app/view/HistoryScreen/Widgets/search_history.dart';

///WIDGET TO SEARCH AND DISPLAY TRANSACTION HISTORY
class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
        ///WIDGET TO DISPLAY "HISTORY" TEXT AND SEARCH TEXTFIELD
        SearchHistory(),

        ///WIDGET TO SHOW TRANSACTION HISTORY
        Expanded(child: History())
      ]),
    );
  }
}
