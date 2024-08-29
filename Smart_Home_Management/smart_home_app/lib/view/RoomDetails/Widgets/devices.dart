import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:smart_home_app/controller/room_controller.dart';

///WIDGET TO SHOW ALL AVAILABLE DEVICES
class Devices extends StatelessWidget {
  const Devices({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: width * 0.8,
          child: Row(
            children: [
              Text(
                "Devices",
                style: GoogleFonts.inter(
                    fontSize: width * 0.05, //20.6
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(255, 255, 255, 1)),
              ),
              const Spacer(),

              ///ADD DEVICES BUTTON
              GestureDetector(
                child: Icon(Icons.add_circle,
                    size: width * 0.06,
                    color: const Color.fromRGBO(255, 255, 255, 0.7)),
              )
            ],
          ),
        ),
        SizedBox(height: height * 0.022),
        SizedBox(
            height: height / 3.5,
            child: Consumer<RoomController>(

                /// THE CONSUMER WIDGET LISTENS TO CHANGES IN THE ROOMCONTROLLER
                builder: (context, roomController, snapshot) {
              ///LIST OF DEVICES
              List devicesList = roomController.roomList[2].devices;

              ///DISPLAY ALL DEVICES FROM DEVICESLIST
              return ListView.separated(
                  itemCount: devicesList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        ///SET THE SELECTED DEVICE
                        roomController.selectDevice(devicesList[index]);

                        ///BOTTOMSHEET
                        showBottomSheet(
                            context: context,
                            builder: (ctx) {
                              return Container(
                                height: height * 0.23,
                                width: width,
                                padding: EdgeInsets.only(
                                    top: height * 0.009,
                                    left: width * 0.07,
                                    bottom: height * 0.06,
                                    right: width * 0.07),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(width * 0.06),
                                        topRight:
                                            Radius.circular(width * 0.06)),
                                    color: const Color.fromRGBO(0, 0, 0, 0.39)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Center(
                                      child: Container(
                                        height: height * 0.006,
                                        width: width * 0.15,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          color: const Color.fromRGBO(
                                              255, 255, 255, 0.37),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "Power Consumption",
                                      style: GoogleFonts.inter(
                                          fontSize: width * 0.05, //20.6
                                          fontWeight: FontWeight.w500,
                                          color: const Color.fromRGBO(
                                              255, 255, 255, 1)),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Total Supply",
                                          style: GoogleFonts.inter(
                                              fontSize: width * 0.036, //20.6
                                              fontWeight: FontWeight.w500,
                                              color: const Color.fromRGBO(
                                                  204, 204, 204, 1)),
                                        ),
                                        const Spacer(),
                                        Text(
                                          "500 W",
                                          style: GoogleFonts.inter(
                                              fontSize: width * 0.036, //20.6
                                              fontWeight: FontWeight.w500,
                                              color: const Color.fromRGBO(
                                                  204, 204, 204, 1)),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Total Savings",
                                          style: GoogleFonts.inter(
                                              fontSize: width * 0.036, //20.6
                                              fontWeight: FontWeight.w500,
                                              color: const Color.fromRGBO(
                                                  204, 204, 204, 1)),
                                        ),
                                        const Spacer(),
                                        Text(
                                          "19%",
                                          style: GoogleFonts.inter(
                                              fontSize: width * 0.036, //20.6
                                              fontWeight: FontWeight.w500,
                                              color: const Color.fromRGBO(
                                                  204, 204, 204, 1)),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              );
                            });
                      },
                      child: Container(
                          height: height / 3.5,
                          width: roomController.selectedDevice ==
                                  devicesList[index]
                              ? width * 0.37
                              : width * 0.3,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: roomController.selectedDevice ==
                                    devicesList[index]
                                ? const Color.fromRGBO(220, 212, 186, 1)
                                : const Color.fromRGBO(255, 255, 255, 0.41),
                          ),

                          ///THE CONTAINER TO SHOW SELECTED DEVICE
                          child: roomController.selectedDevice !=
                                  devicesList[index]
                              ? Stack(
                                  children: [
                                    Positioned(
                                      right: width * 0.06,
                                      top: height * 0.03,
                                      bottom: height * 0.03,
                                      // DEVICE IMAGE
                                      child: Image.asset(
                                        devicesList[index].deviceImg,
                                      ),
                                    ),
                                    Positioned(
                                      bottom: height * 0.001,
                                      left: width * 0.05,
                                      child: SizedBox(
                                        width: width * 0.2,

                                        ///DEVICE NAME
                                        child: Text(
                                          devicesList[index].deviceName,
                                          style: GoogleFonts.inter(
                                              fontSize: width * 0.037, //15
                                              fontWeight: FontWeight.w600,
                                              color: const Color.fromRGBO(
                                                  0, 0, 0, 1)),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              : Stack(
                                  children: [
                                    Positioned(
                                      right: width * 0.15,
                                      bottom: 0,
                                      top: height * 0.005,

                                      ///DEVICE IMAGE

                                      child: Image.asset(
                                        devicesList[index].deviceImg,
                                        height: height * 0.7,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Positioned(
                                      left: width * 0.05,
                                      right: width * 0.05,
                                      top: height * 0.16,
                                      bottom: height * 0.01,
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            ///DEVICE NAME

                                            Text(
                                              devicesList[index].deviceName,
                                              style: GoogleFonts.inter(
                                                  fontSize: width * 0.045,
                                                  fontWeight: FontWeight.w600,
                                                  color: const Color.fromRGBO(
                                                      0, 0, 0, 1)),
                                            ),

                                            ///BUTTON TO NAVIGATE DEVICEDETAILS()
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.of(context)
                                                    .pushNamed("devicedetails");
                                              },
                                              child: Container(
                                                height: height * 0.045,
                                                width: width * 0.25,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    color: const Color.fromRGBO(
                                                        0, 0, 0, 1),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Text(
                                                  "View",
                                                  style: GoogleFonts.inter(
                                                      fontSize:
                                                          width * 0.036, //16.06
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color:
                                                          const Color.fromRGBO(
                                                              255,
                                                              255,
                                                              255,
                                                              1)),
                                                ),
                                              ),
                                            )
                                          ]),
                                    ),
                                  ],
                                )),
                    );
                  },
                  separatorBuilder: (context, idx) => SizedBox(
                        width: width * 0.03,
                      ));
            }))
      ],
    );
  }
}
