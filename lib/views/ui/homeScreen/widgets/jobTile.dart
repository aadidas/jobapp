import 'package:flutter/material.dart';
import 'package:jobapp/constants/app_constants.dart';
import 'package:jobapp/views/commons/width_spacer.dart';

class JobTile extends StatefulWidget {
  const JobTile({super.key, this.onTap});

  final void Function()? onTap;

  @override
  State<JobTile> createState() => _JobTileState();
}

class _JobTileState extends State<JobTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: width * 0.7,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.tertiary,
            borderRadius: const BorderRadius.all(
              Radius.circular(16.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://source.unsplash.com/random/300×300?facebook'),
                      radius: 15,
                    ),
                    const WidthSpacer(size: 20),
                    Text(
                      'Facebook',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
                Text(
                  'Flutter Developer',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '15K/Month',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const Icon(Icons.arrow_circle_right_rounded)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
