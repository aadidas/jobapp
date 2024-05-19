import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:jobapp/controllers/exports.dart';
import 'package:jobapp/views/commons/app_bar.dart';
import 'package:jobapp/views/commons/custom_outline_btn.dart';
import 'package:jobapp/views/commons/text_fields.dart';
import 'package:provider/provider.dart';

import '../../commons/height_spacer.dart';
import '../mainScreen/mainScreen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginNotifier>(
      builder: (context, loginNotifier, child) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: CustomAppBar(
              title: 'Login',
              actions: [],
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: const Icon(
                  CupertinoIcons.arrow_left,
                ),
              ),
            ),
          ),
          body: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Theme.of(context).colorScheme.surface, // Start color
                  Theme.of(context).colorScheme.surfaceTint, // End color
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Spacer(),
                Text(
                  'Welcome Back',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const HeightSpacer(size: 40),
                Text(
                  'Fill the below form to login',
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.left,
                ),
                const Spacer(),
                CustomTextField(
                  controller: email,
                  hintText: 'Email id',
                  keyboardType: TextInputType.emailAddress,
                  validator: (email) {
                    if (email!.isEmpty || !email.contains('@')) {
                      return 'Please enter valid email';
                    } else {
                      return null;
                    }
                  },
                ),
                const HeightSpacer(size: 20),
                CustomTextField(
                  controller: password,
                  hintText: 'Password',
                  keyboardType: TextInputType.visiblePassword,
                  validator: (password) {
                    if (password!.isEmpty || password.length < 6) {
                      return 'Please enter valid password';
                    } else {
                      return null;
                    }
                  },
                  suffixIcon: GestureDetector(
                    onTap: () {
                      loginNotifier.obscureText = !loginNotifier.obscureText;
                    },
                    child: Icon(loginNotifier.obscureText
                        ? Icons.visibility_off
                        : Icons.visibility),
                  ),
                  obscureText: loginNotifier.obscureText,
                ),
                const Spacer(),
                CustomOutlineBtn(
                  text: 'Login',
                  textColor: Theme.of(context).primaryColor,
                  btnColor: Theme.of(context).canvasColor,
                  width: 200.w,
                  height: 50.h,
                  onTap: () async {
                    await Get.to(() => const MainScreen());
                  },
                ),
                const Spacer(),
              ],
            ),
          ),
        );
      },
    );
  }
}
