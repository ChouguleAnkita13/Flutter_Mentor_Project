import 'package:flutter/material.dart';
import 'package:wallet_app/view/HomeScreen/Widgets/latest_transaction.dart';
import 'package:wallet_app/view/HomeScreen/Widgets/recent_transfer.dart';
import 'package:wallet_app/view/HomeScreen/Widgets/top_container.dart';

///WIDGET TO DISPLAY GREETINGS,MAINBALACE,RECENT TRANSFER CONTACTLIST AND LATEST TRANSACTION
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: Column(
        children: [
          ///TOP CONTAINER TO DISPLAY GREETINGS AND MAIN BALANCE
          TopContainer(),

          ///RECENT TRANSFER
          RecentTransfer(),

          ///LATEST TRANSACTION
          Expanded(child: LatestTransaction())
        ],
      ),
    );
  }
}
