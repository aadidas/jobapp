import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:jobapp/controllers/zoomNotifier.dart';
import 'package:jobapp/views/commons/drawer/drawer_item.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatefulWidget {
  final ValueSetter indexSetter;
  const CustomDrawer({super.key, required this.indexSetter});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ZoomNotifier>(
      builder: (context, zoomNotifier, child) {
        return GestureDetector(
          onDoubleTap: () {
            ZoomDrawer.of(context)!.toggle();
          },
          child: Scaffold(
            backgroundColor: Theme.of(context).colorScheme.primaryContainer,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DrawerItem(
                  icon: Icons.home,
                  text: 'Home',
                  index: 0,
                  color: zoomNotifier.currentIndex == 0
                      ? Theme.of(context).colorScheme.onPrimary
                      : Theme.of(context).disabledColor,
                  onTap: () {
                    widget.indexSetter(0);
                    ZoomDrawer.of(context)?.toggle();
                  },
                ),
                DrawerItem(
                  icon: Icons.chat,
                  text: 'Chat',
                  index: 1,
                  color: zoomNotifier.currentIndex == 1
                      ? Theme.of(context).colorScheme.onPrimary
                      : Theme.of(context).disabledColor,
                  onTap: () {
                    widget.indexSetter(1);
                    ZoomDrawer.of(context)?.toggle();
                  },
                ),
                DrawerItem(
                  icon: Icons.bookmark,
                  text: 'BookMark',
                  index: 2,
                  color: zoomNotifier.currentIndex == 2
                      ? Theme.of(context).colorScheme.onPrimary
                      : Theme.of(context).disabledColor,
                  onTap: () {
                    widget.indexSetter(2);
                    ZoomDrawer.of(context)?.toggle();
                  },
                ),
                DrawerItem(
                  icon: Icons.settings,
                  text: 'Settings',
                  index: 3,
                  color: zoomNotifier.currentIndex == 3
                      ? Theme.of(context).colorScheme.onPrimary
                      : Theme.of(context).disabledColor,
                  onTap: () {
                    widget.indexSetter(3);
                    ZoomDrawer.of(context)?.toggle();
                  },
                ),
                DrawerItem(
                  icon: Icons.person,
                  text: 'Profile',
                  index: 4,
                  color: zoomNotifier.currentIndex == 4
                      ? Theme.of(context).colorScheme.onPrimary
                      : Theme.of(context).disabledColor,
                  onTap: () {
                    widget.indexSetter(4);
                    ZoomDrawer.of(context)?.toggle();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
