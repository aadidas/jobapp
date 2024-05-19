import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key, required this.child, required this.actions, this.title});

  final Widget child;
  final List<Widget> actions;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(),
      automaticallyImplyLeading: false,
      leadingWidth: 70.w,
      leading: child,
      actions: actions,
      centerTitle: true,
      title: Text(
        title ?? '',
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }
}
