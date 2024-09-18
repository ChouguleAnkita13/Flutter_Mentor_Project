import 'package:flutter/material.dart';

///WIDGET TO DISPLAY OTP TEXTFIELDS
class OTPTextfield extends StatelessWidget {
  const OTPTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.sizeOf(context).width;
    return SizedBox(
      height: 56,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 4,
        separatorBuilder: (context, index) => SizedBox(
          width: deviceWidth / 9.99,
        ),
        itemBuilder: (context, index) {
          return Container(
            width: 56,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color.fromRGBO(204, 211, 196, 1)),
              boxShadow: const [
                BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.06),
                    offset: Offset(0, 8),
                    blurRadius: 20)
              ],
              color: Colors.white,
            ),
            child: const TextField(
              decoration: InputDecoration(border: InputBorder.none),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
            ),
          );
        },
      ),
    );
  }
}
