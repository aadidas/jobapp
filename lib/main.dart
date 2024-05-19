import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobapp/controllers/exports.dart';
import 'package:jobapp/theme/theme.dart';
import 'package:provider/provider.dart';

import 'views/ui/onBoarding/onboarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => OnBoardingNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => SignUpNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => ZoomNotifier(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(411.42, 867.42),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Job app with node.js',
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: ThemeMode.system,
          home: const OnBoardingScreen(),
        );
      },
    );
  }
}
