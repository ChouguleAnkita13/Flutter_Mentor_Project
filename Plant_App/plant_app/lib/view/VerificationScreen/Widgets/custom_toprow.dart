import 'package:flutter/material.dart';

///WIDGET TO DISPLAY CUSTOM TOP ROW OF VERIFICATION SCREEN WITH BACKICON AND CIRCLE IMAGE
class CustomToprow extends StatelessWidget {
  const CustomToprow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ///BACK BUTTON
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

        ///TOP IMAGE
        Transform.translate(
            offset: const Offset(0.0, -30.0),
            child: Image.asset("assets/images/Group2.png")),
      ],
    );
  }
}
