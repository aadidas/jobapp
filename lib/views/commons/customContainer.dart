import 'package:flutter/material.dart';
import 'package:jobapp/constants/app_constants.dart';

class CustomContainer extends StatefulWidget {
  const CustomContainer({super.key, required this.child});

  final Widget child;

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: width,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiary,
          borderRadius: const BorderRadius.all(
            Radius.circular(16.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: widget.child,
        ),
      ),
    );
  }
}
