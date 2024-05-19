import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobapp/views/commons/custom_outline_btn.dart';

class DeviceInfo extends StatefulWidget {
  const DeviceInfo(
      {super.key,
      required this.deviceName,
      required this.loginData,
      required this.ipAddress,
      required this.location,
      required this.platform});

  final String deviceName;
  final DateTime loginData;
  final String ipAddress;
  final String location;
  final String platform;

  @override
  State<DeviceInfo> createState() => _DeviceInfoState();
}

class _DeviceInfoState extends State<DeviceInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.teal.shade50,
          borderRadius: const BorderRadius.all(Radius.circular(16.0))),
      height: 110.h,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.platform,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  widget.deviceName,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const Spacer(),
                Text(
                  widget.loginData.toString(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomOutlineBtn(
                  text: 'LOGOUT',
                  textColor: Theme.of(context).colorScheme.error,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
