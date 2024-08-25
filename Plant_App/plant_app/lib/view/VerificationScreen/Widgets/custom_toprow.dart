import 'package:flutter/material.dart';

class CustomToprow extends StatelessWidget {
  const CustomToprow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Icon(Icons.arrow_back_sharp),
          ),
        ),
        const Spacer(),
        Transform.translate(
            offset: const Offset(0.0, -30.0),
            child: Image.asset("assets/images/Group2.png")),
      ],
    );
  }
}
