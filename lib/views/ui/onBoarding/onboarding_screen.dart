import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:jobapp/views/ui/auth/login.dart';
import 'package:jobapp/views/ui/auth/signup.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../controllers/onBoardingNotifier.dart';
import 'widgets/page_one.dart';
import 'widgets/page_three.dart';
import 'widgets/page_two.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  PageController onBoardingPageController = PageController(initialPage: 0);

  @override
  void dispose() {
    onBoardingPageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer<OnBoardingNotifier>(
        builder: (context, onBoardingNotifier, child) {
      return Stack(
        children: [
          PageView(
            controller: onBoardingPageController,
            physics: onBoardingNotifier.isLastPage
                ? const NeverScrollableScrollPhysics()
                : const AlwaysScrollableScrollPhysics(),
            onPageChanged: (page) {
              onBoardingNotifier.isLastPage = page == 2;
            },
            children: [
              PageOne(
                title: 'Your Dream Job Awaits',
                description:
                    'Welcome to Job app! Discover opportunities that match your skills and passions. Start exploring personalized job recommendations and apply with ease. Let\'s find your perfect career path together.',
                onTapSkip: () {
                  onBoardingPageController.animateToPage(2,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.linear);
                },
                onTapNext: () {
                  onBoardingPageController.animateToPage(1,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.linear);
                },
              ),
              PageTwo(
                title: 'Seamless Job Search',
                description:
                    'Effortlessly browse through thousands of job listings tailored just for you. From creating a standout profile to tracking your applications, we provide all the tools you need to land your next job. Get started today!',
                onTapSkip: () {
                  onBoardingPageController.animateToPage(2,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.linear);
                },
                onTapNext: () {
                  onBoardingPageController.animateToPage(2,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.linear);
                },
              ),
              PageThree(
                title: 'Boost Your Career',
                description:
                    'Take the next step in your professional journey with Job app. Access exclusive job offers, network with top employers, and enhance your skills with our career resources. Join us now and transform your career prospects.',
                onTapLogin: () async {
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.setBool('entrypoint', true);
                  await Get.to(() => const LoginScreen());
                },
                onTapSignup: () async {
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.setBool('entrypoint', true);
                  await Get.to(() => const SignupPage());
                },
                onTapGuest: () async {
                  final SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.setBool('entrypoint', true);
                  // await Get.to(() => const LoginScreen());
                },
              ),
            ],
          ),
          Positioned(
            bottom: 10.h,
            left: 0,
            right: 0,
            child: onBoardingNotifier.isLastPage
                ? const SizedBox.shrink()
                : Center(
                    child: SmoothPageIndicator(
                      controller: onBoardingPageController,
                      count: 3,
                      effect: WormEffect(
                          dotColor: Theme.of(context).colorScheme.onSecondary,
                          activeDotColor:
                              Theme.of(context).colorScheme.primary),
                    ),
                  ),
          ),
        ],
      );
    }));
  }
}
