import 'package:flutter/material.dart';

import '../utils/constant/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Icon? icon;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChanged;
  final int? maxLines;
  const CustomTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      this.icon,
      this.keyboardType,
      this.onChanged,
      this.validator,
      this.maxLines});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      keyboardType: keyboardType,
      controller: controller,
      onChanged: onChanged,
      validator: validator,
      decoration: InputDecoration(
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: kPrimaryColor),
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: kPrimaryColor),
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
          ),
          suffixIcon: icon,
          suffixIconColor: kPrimaryColor,
          hintText: hintText,
          hintStyle: const TextStyle(color: kPrimaryColor),
          contentPadding: const EdgeInsets.only(left: 10, top: 10)),
    );
  }
}
