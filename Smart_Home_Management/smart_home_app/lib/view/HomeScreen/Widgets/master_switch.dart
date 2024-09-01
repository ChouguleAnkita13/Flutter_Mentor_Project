import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

///WIDGET TO DISPLAY MASTER SWITCH,ACTIVE DEVICES
class MasterSwitch extends StatelessWidget {
  const MasterSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.sizeOf(context).height;
    final double deviceWidth = MediaQuery.sizeOf(context).width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///MASTER SWITCH:TEXT
        Text(
          "Master Switch",
          style: GoogleFonts.inter(
              fontSize: deviceWidth * 0.036, //16
              fontWeight: FontWeight.w500,
              color: const Color.fromRGBO(255, 255, 255, 1)),
        ),

        ///CONTAINER TO SHOW ACTIVE DEVICES AND
        Container(
          height: deviceHeight * 0.067, //60
          width: MediaQuery.sizeOf(context).width,
          padding: EdgeInsets.symmetric(horizontal: deviceWidth * 0.05),
          decoration: const BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 0.15),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
          ),
          child: Row(
            children: [
              Text(
                "5  ",
                style: GoogleFonts.inter(
                    fontSize: deviceWidth * 0.06, //24,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(255, 255, 255, 1)),
              ),
              Text(
                "Active Devices",
                style: GoogleFonts.inter(
                    fontSize: deviceWidth * 0.037, //15.24
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(255, 255, 255, 1)),
              ),
              const Spacer(),

              ///ICON
              Icon(
                Icons.bolt_outlined,
                color: const Color.fromRGBO(255, 255, 255, 1),
                size: deviceWidth * 0.06,
              ),

              ///SWITCH BUTTON
              SizedBox(
                height: deviceHeight * 0.035,
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: Switch(
                      value: true,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      activeColor: const Color.fromRGBO(0, 0, 0, 1),
                      activeTrackColor: const Color.fromRGBO(255, 255, 255, 1),
                      onChanged: (val) {}),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
