import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_bloc_app/controller/HomeBloc/home_bloc.dart';
import 'package:grocery_bloc_app/controller/HomeBloc/home_event.dart';

class CustomRow extends StatelessWidget {
  const CustomRow({super.key, required this.title, required this.homeBloc});
  final HomeBloc homeBloc;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 35, bottom: 10, left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style:
                GoogleFonts.poppins(fontSize: 21, fontWeight: FontWeight.w700),
          ),
          GestureDetector(
            onTap: () {
              homeBloc.add(HomeSeeAllButtonNavigateEvent());
            },
            child: Text("See all",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromRGBO(14, 161, 125, 1),
                )),
          ),
        ],
      ),
    );
  }
}
