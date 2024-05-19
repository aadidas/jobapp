import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.keyboardType,
      this.obscureText,
      this.suffixIcon,
      this.validator});

  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;
  final bool? obscureText;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        fillColor: Theme.of(context).canvasColor,
        hintText: hintText,
        suffixIcon: suffixIcon,
        hintStyle: Theme.of(context)
            .textTheme
            .titleSmall
            ?.copyWith(color: Theme.of(context).disabledColor),
        errorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(8.0),
          ),
          borderSide: BorderSide(
              color: Theme.of(context).colorScheme.error, width: 0.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(8.0),
          ),
          borderSide:
              BorderSide(color: Theme.of(context).primaryColor, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(8.0),
          ),
          borderSide: BorderSide(
              color: Theme.of(context).colorScheme.error, width: 0.5),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(8.0),
          ),
          borderSide:
              BorderSide(color: Theme.of(context).disabledColor, width: 0.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(8.0),
          ),
          borderSide:
              BorderSide(color: Theme.of(context).primaryColor, width: 0.5),
        ),
      ),
      controller: controller,
      cursorHeight: 25,
      style: Theme.of(context).textTheme.titleSmall,
      validator: validator,
    );
  }
}
