import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../controllers/exports.dart';
import '../../commons/app_bar.dart';
import '../../commons/custom_outline_btn.dart';
import '../../commons/height_spacer.dart';
import '../../commons/text_fields.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController name = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    name.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SignUpNotifier>(
      builder: (context, signUpNotifier, child) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: CustomAppBar(
              title: 'SignUp',
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
                  'Welcome',
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const HeightSpacer(size: 40),
                Text(
                  'Fill the below form to signup',
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.left,
                ),
                const Spacer(),
                CustomTextField(
                  controller: name,
                  hintText: 'Name',
                  keyboardType: TextInputType.name,
                  validator: (name) {
                    if (name!.isEmpty) {
                      return 'Please enter valid name';
                    } else {
                      return null;
                    }
                  },
                ),
                const HeightSpacer(size: 20),
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
                    if (signUpNotifier.passwordValidator(password!)) {
                      return 'Please enter valid password with atleast 1 upper case letter , 1 lower case letter, 1 digit, 1 special character and length should be more than 8 character';
                    } else {
                      return null;
                    }
                  },
                ),
                const Spacer(),
                CustomOutlineBtn(
                  text: 'Sign Up',
                  textColor: Theme.of(context).primaryColor,
                  btnColor: Theme.of(context).canvasColor,
                  width: 200.w,
                  height: 50.h,
                  onTap: () {},
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
