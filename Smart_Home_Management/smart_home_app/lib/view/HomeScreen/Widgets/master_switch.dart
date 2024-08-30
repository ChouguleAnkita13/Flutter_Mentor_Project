import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

///WIDGET TO DISPLAY MASTER SWITCH,ACTIVE DEVICES
class MasterSwitch extends StatelessWidget {
  const MasterSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;
    final double width = MediaQuery.sizeOf(context).width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///MASTER SWITCH:TEXT
        Text(
          "Master Switch",
          style: GoogleFonts.inter(
              fontSize: width * 0.036, //16
              fontWeight: FontWeight.w500,
              color: const Color.fromRGBO(255, 255, 255, 1)),
        ),

        ///CONTAINER TO SHOW ACTIVE DEVICES AND
        Container(
          height: height * 0.067, //60
          width: MediaQuery.sizeOf(context).width,
          padding: EdgeInsets.symmetric(horizontal: width * 0.05),
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
                    fontSize: width * 0.06, //24,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(255, 255, 255, 1)),
              ),
              Text(
                "Active Devices",
                style: GoogleFonts.inter(
                    fontSize: width * 0.037, //15.24
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(255, 255, 255, 1)),
              ),
              const Spacer(),
              Icon(
                Icons.bolt_outlined,
                color: const Color.fromRGBO(255, 255, 255, 1),
                size: width * 0.06,
              ),
              // SwitchListTile(value: true, onChanged: (value){})
            ],
          ),
        )
      ],
    );
  }
}
