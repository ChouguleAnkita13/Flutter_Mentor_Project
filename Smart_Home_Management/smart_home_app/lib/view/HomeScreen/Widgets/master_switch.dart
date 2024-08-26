import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//Widget to display MasterSwitch,active devices
class MasterSwitch extends StatelessWidget {
  const MasterSwitch({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //Master switch :Text
        Text(
          "Master Switch",
          style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: const Color.fromRGBO(255, 255, 255, 1)),
        ),
        //Container to show active devices and glitter
        Container(
          height: 60,
          width: MediaQuery.sizeOf(context).width,
          padding: const EdgeInsets.symmetric(horizontal: 20),
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
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: const Color.fromRGBO(255, 255, 255, 1)),
        ),
        Text(
          "Active Devices",
          style: GoogleFonts.inter(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: const Color.fromRGBO(255, 255, 255, 1)),
        ),
        const Spacer(),
        const Icon(Icons.bolt_outlined,color: Color.fromRGBO(255, 255, 255, 1)),
        // SwitchListTile(value: true, onChanged: (value){})
          
            ],
          ),
        )
      ],
    );
  }
}
