import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jobapp/views/commons/app_bar.dart';
import 'package:jobapp/views/commons/height_spacer.dart';
import 'package:jobapp/views/ui/homeScreen/widgets/heading.dart';
import 'package:jobapp/views/ui/homeScreen/widgets/jobTile.dart';
import 'package:jobapp/views/ui/searchScreen/searchScreen.dart';

import '../../commons/drawer/drawer_widget.dart';
import '../jobScreen/jobScreen.dart';
import 'widgets/search_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: CustomAppBar(
          actions: [
            GestureDetector(
              onTap: () {},
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://source.unsplash.com/random/300×300?man'),
                  radius: 15,
                ),
              ),
            )
          ],
          child: const DrawerWidget(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeightSpacer(size: 20),
                Text(
                  'Search \nFind \nApply',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const HeightSpacer(size: 40),
                SearchWidget(
                  onTap: () {
                    Get.to(() => const SearchScreen());
                  },
                ),
                const HeightSpacer(size: 40),
                Heading(
                  text: 'Popular jobs',
                  onTap: () {},
                ),
                const HeightSpacer(size: 10),
                SizedBox(
                  height: 150.h,
                  child: ListView.builder(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return JobTile(
                          onTap: () {
                            Get.to(() => const JobScreen(
                                  jobTitle: 'Flutter Developer - Facebook',
                                  id: '1',
                                ));
                          },
                        );
                      }),
                ),
                const HeightSpacer(size: 40),
                Heading(
                  text: 'Recently Posted',
                  onTap: () {},
                ),
                const HeightSpacer(size: 10),
                SizedBox(
                  height: 150.h,
                  child: ListView.builder(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return JobTile(
                          onTap: () {
                            Get.to(() => const JobScreen(
                                  jobTitle: 'Flutter Developer - Facebook',
                                  id: '1',
                                ));
                          },
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
