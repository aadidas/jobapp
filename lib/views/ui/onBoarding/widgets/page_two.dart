import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/app_constants.dart';
import '../../../commons/custom_outline_btn.dart';

class PageTwo extends StatelessWidget {
  const PageTwo(
      {super.key,
      required this.title,
      required this.description,
      required this.onTapSkip,
      required this.onTapNext});

  final String title;
  final String description;
  final void Function() onTapSkip;
  final void Function() onTapNext;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.all(8.0).w,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onBackground,
          image: const DecorationImage(
            image: AssetImage('assets/ai/ob_two.png'),
            fit: BoxFit.fill,
            opacity: 0.5,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              title,
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSecondary,
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              description,
              textAlign: TextAlign.justify,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSecondary,
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w400),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomOutlineBtn(
                  text: 'Skip',
                  textColor: Theme.of(context).colorScheme.onSecondary,
                  onTap: onTapSkip,
                ),
                CustomOutlineBtn(
                  text: 'Next',
                  textColor: Theme.of(context).colorScheme.onSecondary,
                  onTap: onTapNext,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
