import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobapp/constants/app_constants.dart';
import 'package:jobapp/controllers/exports.dart';
import 'package:jobapp/views/commons/height_spacer.dart';
import 'package:jobapp/views/ui/onBoarding/onboarding_screen.dart';
import 'package:jobapp/views/ui/settings/widgets/deviceInfo.dart';
import 'package:provider/provider.dart';

import '../../commons/app_bar.dart';
import '../../commons/drawer/drawer_widget.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    var zoomNotifier = Provider.of<ZoomNotifier>(context);
    var onBoardNotifier = Provider.of<OnBoardingNotifier>(context);
    DateTime loginData = DateTime.now();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: CustomAppBar(
          actions: [
            GestureDetector(
              onTap: () {},
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://source.unsplash.com/random/300×300?man'),
                  radius: 15,
                ),
              ),
            )
          ],
          title: 'Settings',
          child: const DrawerWidget(),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: height - 100.h,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const HeightSpacer(size: 40),
                Text(
                  'You have logged in into your account on these devices',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const HeightSpacer(size: 40),
                DeviceInfo(
                    deviceName: 'Mac book M2 max',
                    loginData: loginData,
                    ipAddress: '1.00.21.4123',
                    location: 'mumbai',
                    platform: 'Mobile App'),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    zoomNotifier.currentIndex = 0;
                    onBoardNotifier.isLastPage = false;
                    Get.to(() => const OnBoardingScreen());
                  },
                  child: Text(
                    'Logout from all devices',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: Theme.of(context).colorScheme.error),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
