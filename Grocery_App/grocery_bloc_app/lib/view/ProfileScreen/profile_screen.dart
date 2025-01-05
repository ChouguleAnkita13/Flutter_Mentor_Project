import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_bloc_app/controller/LoginRegisterBloc/login_register_bloc.dart';
import 'package:grocery_bloc_app/controller/LoginRegisterBloc/login_register_event.dart';
import 'package:grocery_bloc_app/controller/LoginRegisterBloc/login_register_state.dart';
import 'package:grocery_bloc_app/controller/SharedPrefernce/session_data.dart';
import 'package:grocery_bloc_app/view/LoginRegister/login_screen.dart';
import 'package:grocery_bloc_app/view/ProfileScreen/profile_options.dart';
import 'package:grocery_bloc_app/view/Widgets/custom_appbar.dart';
import 'package:grocery_bloc_app/view/notification_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loginRegisterBloc = LoginRegisterBloc();

    return BlocListener(
      bloc: loginRegisterBloc,
      listener: (context, state) {
        if (state is LogoutButtonNavigateState) {
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const LoginScreen()),
              (route) => false);
        } else {
          if (state is NavigateToNotificationPageState) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const NotificationScreen()));
          }
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppbar.customAppbar("Profile"),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile Picture Section
              Container(
                height: 130,
                width: 130,
                margin: const EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: const Color.fromRGBO(14, 161, 125, 1), width: 4),
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.grey[100],
                  child: const Icon(
                    Icons.person,
                    color: Color.fromRGBO(14, 161, 125, 1),
                    size: 60,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // User Name and Email
              Text(
                SessionData.username!,
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                SessionData.email!,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),

              const SizedBox(height: 20),

              // Profile Options
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    ProfileOptions(
                      icon: Icons.shopping_cart_outlined,
                      title: "My Orders",
                      onTap: () {
                        // Navigate to Orders Page
                      },
                    ),
                    ProfileOptions(
                      icon: Icons.notifications_outlined,
                      title: "Notifications",
                      onTap: () {
                        loginRegisterBloc
                            .add(NotificationButtonNavigateEvent());
                      },
                    ),
                    ProfileOptions(
                      icon: Icons.location_on_outlined,
                      title: "Delivery Address",
                      onTap: () {
                        // Navigate to Delivery Address Page
                      },
                    ),
                    ProfileOptions(
                      icon: Icons.settings,
                      title: "Settings",
                      onTap: () {
                        // Navigate to Settings Page
                      },
                    ),
                    ProfileOptions(
                      icon: Icons.logout,
                      title: "Logout",
                      onTap: () {
                        loginRegisterBloc.add(LogoutButtonNavigateEvent());
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
