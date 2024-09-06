import 'package:flutter/material.dart';
import 'package:wallet_app/view/ProfileScreen/Widgets/info_container.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        InfoContainer(
            imgUrl: "assets/images/more/name.png",
            title: "Full Name",
            subTitle: "Ankita Chougule"),
        InfoContainer(
            imgUrl: "assets/images/more/mobile.png",
            title: "Mobile",
            subTitle: "9876543210"),
        InfoContainer(
            imgUrl: "assets/images/more/email.png",
            title: "Email",
            subTitle: "ankita@gmail.com"),
        InfoContainer(
            imgUrl: "assets/images/more/change_password.png",
            title: "",
            subTitle: "Change Password"),
      ],
    );
  }
}
