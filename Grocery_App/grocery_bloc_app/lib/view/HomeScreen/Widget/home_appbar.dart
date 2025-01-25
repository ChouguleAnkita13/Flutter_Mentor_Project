import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_bloc_app/controller/HomeBloc/home_bloc.dart';
import 'package:grocery_bloc_app/controller/HomeBloc/home_event.dart';
import 'package:grocery_bloc_app/controller/SharedPrefernceData/session_data.dart';
import 'package:grocery_bloc_app/view/LoginRegister/Widget/custom_textfield.dart';

class HomeAppbar {
  static PreferredSizeWidget appBar(HomeBloc homeBloc) {
    return AppBar(
      backgroundColor: const Color.fromRGBO(14, 161, 125, 1),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20))),
      toolbarHeight: 150,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                  child: Icon(
                Icons.person,
                color: Color.fromRGBO(14, 161, 125, 1),
              )),
              const SizedBox(
                width: 8,
              ),
              Text(
                'Hi, ${SessionData.username?.split(' ').first}',
                style: GoogleFonts.poppins(
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 40,
            child: CustomTextfield(
              title: "Search",
              textcontroller: TextEditingController(),
            ),
          ),
        ],
      ),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: Transform.translate(
          offset: const Offset(0, 25),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              "assets/images/veggie2.png",
              height: 100,
              width: 320,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: GestureDetector(
              onTap: () {
                homeBloc.add(HomeNotificationButtonNavigateEvent());
              },
              child: const Icon(
                Icons.notifications_none,
                color: Colors.white,
                size: 30,
              )),
        ),
      ],
    );
  }
}
