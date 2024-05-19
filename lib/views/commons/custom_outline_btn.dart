import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomOutlineBtn extends StatelessWidget {
  const CustomOutlineBtn(
      {super.key,
      this.width,
      this.height,
      required this.text,
      this.onTap,
      required this.textColor,
      this.btnColor});

  final double? width;
  final double? height;
  final String text;
  final void Function()? onTap;
  final Color textColor;
  final Color? btnColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            const Radius.circular(16.0).w,
          ),
          border: Border.all(
              color: Theme.of(context).colorScheme.onSecondary, width: 1.0),
          color: btnColor ?? Colors.transparent,
        ),
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0).w,
          child: Center(
            child: Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: textColor, fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}
