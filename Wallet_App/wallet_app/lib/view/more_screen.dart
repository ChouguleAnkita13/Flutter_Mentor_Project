import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallet_app/controller/more_controller.dart';
import 'package:wallet_app/model/more_model.dart';

///WIDGET TO DISPLAY MORE ITEMS SCREEN
class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final deviceWidth = Get.width;
    final deviceHeight = Get.height;

    ///GET MOREITEMSLIST OF MOREMODEL USING GETX MORECONTROLLER
    final List<MoreModel> moreItemList =
        Get.find<MoreController>().moreItemList;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      body: Padding(
        padding: EdgeInsets.only(
          left: deviceWidth * 0.044,
          right: deviceWidth * 0.044,
          top: deviceHeight * 0.06,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///TEXT
            Text(
              "More",
              style: GoogleFonts.sora(
                fontSize: deviceWidth < 500
                    ? deviceWidth * 0.07
                    : deviceWidth * 0.05, //24,18
                fontWeight: FontWeight.w600,
                color: const Color.fromRGBO(25, 25, 25, 1),
              ),
            ),
            SizedBox(height: deviceHeight * 0.01),

            ///MORE ITEM LIST
            Expanded(
              child: ListView.separated(
                  itemCount: moreItemList.length,
                  itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          ///NAVIGATE TO SCREEN
                          Get.toNamed(
                              "/${moreItemList[index].moreTitle.toLowerCase().removeAllWhitespace}");
                        },
                        child: ListTile(
                          ///ITEM IMAGE
                          leading: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(deviceWidth * 0.02), //8
                            child: Image.asset(
                              moreItemList[index].moreImgUrl,
                              height: deviceWidth < 500
                                  ? deviceWidth * 0.09 //32
                                  : deviceWidth * 0.06,
                              width: deviceWidth < 500
                                  ? deviceWidth * 0.09
                                  : deviceWidth * 0.06,
                              fit: BoxFit.cover,
                            ),
                          ),

                          ///MORE TITLE
                          title: Text(
                            moreItemList[index].moreTitle,
                            style: GoogleFonts.sora(
                              fontSize: deviceWidth < 500
                                  ? deviceWidth * 0.032
                                  : deviceWidth * 0.021, //14,10
                              fontWeight: FontWeight.w600,
                              color: const Color.fromRGBO(25, 25, 25, 1),
                            ),
                          ),

                          ///ICON
                          trailing: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: const Color.fromRGBO(83, 93, 102, 1),
                            size: deviceWidth * 0.025,
                          ),
                        ),
                      ),

                  ///LISTVIEW SEPERATOR FOR MORE ITEM LIST
                  separatorBuilder: (context, idx) => Container(
                      margin: EdgeInsets.only(
                          top: deviceHeight * 0.01,
                          bottom: deviceHeight * 0.01),
                      height: deviceHeight * 0.0015,
                      color: const Color.fromRGBO(237, 239, 246, 1))),
            )
          ],
        ),
      ),
    );
  }
}
