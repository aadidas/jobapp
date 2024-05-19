import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jobapp/views/commons/customContainer.dart';
import 'package:jobapp/views/commons/height_spacer.dart';
import 'package:jobapp/views/commons/width_spacer.dart';

import '../../../constants/app_constants.dart';
import '../../commons/app_bar.dart';
import '../../commons/drawer/drawer_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
          title: 'Profile',
          child: const DrawerWidget(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://source.unsplash.com/random/300×300?man'),
                  radius: 45,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Luke watson',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Theme.of(context).dividerColor,
                        ),
                        Text(
                          'Nagpur',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        const WidthSpacer(size: 20),
                        Icon(
                          Icons.edit_note,
                          color: Theme.of(context).colorScheme.onErrorContainer,
                          size: 25.w,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const HeightSpacer(size: 40),
            CustomContainer(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    color: Theme.of(context).canvasColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.picture_as_pdf,
                        color: Theme.of(context).colorScheme.error,
                        size: 50.w,
                      ),
                    ),
                  ),
                  const WidthSpacer(size: 30),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Resume on JobApp',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const WidthSpacer(size: 30),
                          Icon(
                            Icons.edit,
                            color: Theme.of(context).canvasColor,
                          )
                        ],
                      ),
                      Text(
                        'Resume JobApp',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ],
                  )
                ],
              ),
            )),
            const HeightSpacer(size: 40),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Skills',
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
          ],
        ),
      ),
    );
  }
}
