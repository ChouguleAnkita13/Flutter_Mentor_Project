import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectRoom extends StatelessWidget {
  const SelectRoom({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Select Room",
          style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: const Color.fromRGBO(255, 255, 255, 1)),
        ),
        const SizedBox(height: 20),
        SizedBox(
            height: MediaQuery.sizeOf(context).height / 4,
            child: ListView.separated(
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset("assets/images/livingroom.jpg",
                            height: MediaQuery.sizeOf(context).height / 4,
                            width: 120,
                            fit: BoxFit.cover),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 10,
                        child: Text(
                          "Living Room",
                          style: GoogleFonts.inter(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromRGBO(0, 0, 0, 1)),
                        ),
                      )
                    ],
                  );
                },
                separatorBuilder: (context, idx) => const SizedBox(
                      width: 10,
                    )))
      ],
    );
  }
}
