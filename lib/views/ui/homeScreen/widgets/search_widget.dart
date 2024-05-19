import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key, this.onTap});

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.search,
                color: Theme.of(context).primaryColor,
                size: 20.w,
              ),
              Text(
                'Search for Jobs',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: Theme.of(context).primaryColor),
              ),
              const Spacer(),
              Icon(
                CupertinoIcons.slider_horizontal_3,
                color: Theme.of(context).disabledColor,
                size: 20.w,
              ),
            ],
          ),
          const Divider(
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
