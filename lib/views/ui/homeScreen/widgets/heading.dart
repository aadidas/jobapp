import 'package:flutter/material.dart';

class Heading extends StatefulWidget {
  const Heading({super.key, required this.text, this.onTap});

  final String text;
  final void Function()? onTap;

  @override
  State<Heading> createState() => _HeadingState();
}

class _HeadingState extends State<Heading> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(widget.text, style: Theme.of(context).textTheme.titleLarge),
        InkWell(
          onTap: widget.onTap,
          child: Text('View all',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Theme.of(context).colorScheme.primary)),
        ),
      ],
    );
  }
}
