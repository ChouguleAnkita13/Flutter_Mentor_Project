import 'package:flutter/material.dart';
import 'package:grocery_bloc_app/view/Widgets/custom_appbar.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppbar.customAppbar("Find Products"),
    );
  }
}
