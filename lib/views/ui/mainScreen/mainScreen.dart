import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:jobapp/controllers/zoomNotifier.dart';
import 'package:jobapp/views/ui/bookmark/bookmarksScreen.dart';
import 'package:jobapp/views/ui/chat/chatScreen.dart';
import 'package:jobapp/views/ui/profile/profileScreen.dart';
import 'package:jobapp/views/ui/settings/settingScreen.dart';
import 'package:provider/provider.dart';

import '../../commons/drawer/custom_drawer.dart';
import '../homeScreen/homeScreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ZoomNotifier>(
      builder: (context, zoomNotifier, child) {
        return ZoomDrawer(
          menuScreen: CustomDrawer(
            indexSetter: (index) {
              zoomNotifier.currentIndex = index;
            },
          ),
          mainScreen: currentScreen(),
          borderRadius: 30,
          showShadow: true,
          angle: 0.0,
          slideWidth: 250.w,
          menuBackgroundColor: Theme.of(context).colorScheme.primaryContainer,
        );
      },
    );
  }

  Widget currentScreen() {
    var zoomNotifier = Provider.of<ZoomNotifier>(context);
    switch (zoomNotifier.currentIndex) {
      case 0:
        return const HomeScreen();
      case 1:
        return const ChatScreen();
      case 2:
        return const BookmarkScreen();
      case 3:
        return const SettingsScreen();
      case 4:
        return const ProfileScreen();
      default:
        return const HomeScreen();
    }
  }
}
