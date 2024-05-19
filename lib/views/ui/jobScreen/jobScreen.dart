import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobapp/constants/app_constants.dart';
import 'package:jobapp/views/commons/custom_outline_btn.dart';
import 'package:jobapp/views/commons/height_spacer.dart';

import '../../commons/app_bar.dart';
import '../../commons/customContainer.dart';

class JobScreen extends StatefulWidget {
  const JobScreen({super.key, required this.jobTitle, required this.id});

  final String jobTitle;
  final String id;

  @override
  State<JobScreen> createState() => _JobScreenState();
}

class _JobScreenState extends State<JobScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: CustomAppBar(
          actions: [
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(
                  CupertinoIcons.bookmark_fill,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            )
          ],
          title: widget.jobTitle,
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomContainer(
              child: Column(
                children: [
                  const CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://source.unsplash.com/random/300×300?facebook'),
                    radius: 40,
                  ),
                  Text(
                    'Flutter Developer',
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const HeightSpacer(size: 20),
                  Text(
                    'Mumbai',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const HeightSpacer(size: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Full-time',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                      Text(
                        '10K/month',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Job Description',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                jobDescription,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Requirement',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: requirements.length,
                itemBuilder: (context, index) {
                  return Text(
                    '${index + 1}.  ${requirements[index]}',
                    style: Theme.of(context).textTheme.bodyLarge,
                  );
                },
              ),
            ),
            const HeightSpacer(size: 40),
            CustomOutlineBtn(
              text: 'Apply',
              textColor: Theme.of(context).colorScheme.onPrimary,
              width: width,
              height: 50.h,
              btnColor: Theme.of(context).primaryColor,
              onTap: () {},
            ),
            const HeightSpacer(size: 40),
          ],
        ),
      ),
    );
  }
}
