import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_bloc_app/controller/LoginRegisterBloc/login_register_bloc.dart';
import 'package:grocery_bloc_app/controller/LoginRegisterBloc/login_register_event.dart';
import 'package:grocery_bloc_app/controller/LoginRegisterBloc/login_register_state.dart';
import 'package:grocery_bloc_app/controller/SharedPrefernceData/session_data.dart';
import 'package:grocery_bloc_app/view/LoginRegister/login_screen.dart';
import 'package:grocery_bloc_app/view/OrderScreen/orderscreen.dart';
import 'package:grocery_bloc_app/view/ProfileScreen/Widgets/address_bottomsheet.dart';
import 'package:grocery_bloc_app/view/ProfileScreen/Widgets/display_username_textfield.dart';
import 'package:grocery_bloc_app/view/ProfileScreen/Widgets/profile_options.dart';
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
        } else if (state is NavigateToNotificationPageState) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const NotificationScreen()));
        } else if (state is NavigateToMyOrdersPageState) {
          /// Navigate to Orders Page
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MyOrdersPage()),
          );
        } else if (state is AddressSaveAddressButtonState) {
          Navigator.of(context).pop();
        } else if (state is AddressShowBottomSheetState) {
          /// Show bottomSheet`
          AddressBottomsheet.showAddressBottomSheet(context, loginRegisterBloc);
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
              DisplayUsernameTextfield(
                loginRegisterBloc: loginRegisterBloc,
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
                        loginRegisterBloc.add(MyOrdersButtonNavigateEvent());
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
                        loginRegisterBloc.add(AddressShowBottomSheetEvent());
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
