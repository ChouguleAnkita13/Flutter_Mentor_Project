import 'package:flutter/material.dart';
import 'package:smart_home_app/model/device_model.dart';
import 'package:smart_home_app/view/DeviceDetailsScreen/Widgets/power_mute.dart';
import 'package:smart_home_app/view/DeviceDetailsScreen/Widgets/volume_wifi_time.dart';

///WIDGET TO SHOW ALL DETAILS OF SELECTED DEVICE
class DetailDevice extends StatelessWidget {
  const DetailDevice({super.key, required this.selectedDevice});
  final DeviceModel selectedDevice;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;
    final double width = MediaQuery.sizeOf(context).width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ///DEVICE IMAGE
        Transform.translate(
          offset: Offset(-width * 0.16, 0),
          ///TEMPORARY CONTIDITIONS HANDLED FOR IMAGE HEIGHT
          child: Image.asset(
            selectedDevice.deviceImg,
            height: selectedDevice.deviceName == "Amazon Echo 2"
                ? height / 2.5
                : (selectedDevice.deviceName == "Amazon Screen"
                    ? height / 6
                    : height / 4),
          ),
        ),
        Expanded(
          child: Column(
            children: [
              ///POWERMUTE() WIDGET TO DISPLAY POWER USAGE,MUTE BUTTON AND
              const PowerMute(),
              SizedBox(height: height * 0.01),

              ///VOLUMNWIFITIME() WIDGET
              const VolumnWifiTime()
            ],
          ),
        )
      ],
    );
  }
}
