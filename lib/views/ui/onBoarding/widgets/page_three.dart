import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/app_constants.dart';
import '../../../commons/custom_outline_btn.dart';

class PageThree extends StatelessWidget {
  const PageThree(
      {super.key,
      required this.title,
      required this.description,
      required this.onTapLogin,
      required this.onTapSignup,
      required this.onTapGuest});

  final String title;
  final String description;
  final void Function() onTapLogin;
  final void Function() onTapSignup;
  final void Function() onTapGuest;

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
            image: AssetImage('assets/ai/ob_three.png'),
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
                  text: 'LOGIN',
                  textColor: Theme.of(context).colorScheme.onSecondary,
                  onTap: onTapLogin,
                ),
                CustomOutlineBtn(
                  text: 'SIGN UP',
                  btnColor: Theme.of(context).colorScheme.onSecondary,
                  textColor: Theme.of(context).colorScheme.primary,
                  onTap: onTapSignup,
                ),
              ],
            ),
            GestureDetector(
              onTap: onTapGuest,
              child: Padding(
                padding: const EdgeInsets.all(8.0).w,
                child: Text(
                  'continue as a guest',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSecondary,
                      fontWeight: FontWeight.w400),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
