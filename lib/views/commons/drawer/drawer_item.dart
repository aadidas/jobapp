import 'package:flutter/material.dart';
import 'package:jobapp/views/commons/height_spacer.dart';
import 'package:jobapp/views/commons/width_spacer.dart';

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final int index;
  final Color color;
  final void Function()? onTap;

  const DrawerItem(
      {super.key,
      required this.icon,
      required this.text,
      required this.index,
      required this.color,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  icon,
                  color: color,
                ),
                const WidthSpacer(size: 10),
                Text(
                  text,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: color),
                ),
              ],
            ),
            const HeightSpacer(size: 50),
          ],
        ),
      ),
    );
  }
}
