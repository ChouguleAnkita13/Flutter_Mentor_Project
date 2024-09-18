import 'package:flutter/material.dart';
import 'package:plant_app/controller/otp_controller.dart';
import 'package:provider/provider.dart';

/// WIDGET TO DISPLAY OTP TEXTFIELDS
class OTPTextfield extends StatelessWidget {
  const OTPTextfield({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.sizeOf(context).width;

    // ACCESS THE OTPCONTROLLER TO HANDLE TEXTFIELDS AND FOCUS NODES
    final otpProvider = Provider.of<OTPController>(context);

    return SizedBox(
      height: 56,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: 4, // NUMBER OF OTP FIELDS
        separatorBuilder: (context, index) => SizedBox(
          width: deviceWidth /9.99,
        ),
        itemBuilder: (context, index) {
          return Container(
            width: 53,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color.fromRGBO(204, 211, 196, 1)),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.06),
                  offset: Offset(0, 8),
                  blurRadius: 20,
                )
              ],
              color: Colors.white,
            ),
            child: TextField(
              // CONTROLLER AND FOCUS NODE MANAGED BY OTPCONTROLLER
              controller: otpProvider.controllers[index],
              focusNode: otpProvider.focusNodes[index],
              keyboardType: TextInputType.number,
              cursorColor: const Color.fromRGBO(204, 211, 196, 1),
              textAlign: TextAlign.center,
              maxLength: 1, // ONLY ALLOW 1 CHARACTER PER FIELD
              decoration: const InputDecoration(
                border: InputBorder.none,
                counterText: '',
              ),
              // HANDLE USER INPUT AND SHIFT FOCUS ACCORDINGLY
              onChanged: (value) => otpProvider.handleInput(value, index),
            ),
          );
        },
      ),
    );
  }
}
