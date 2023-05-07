import 'package:flutter/material.dart';

import '../colors/app_colors.dart';

Widget bildCustomTextField({
  required TextEditingController controller,
  required TextInputType keyboardType,
  String? label,
  String? hint,
  IconData? prefix,
  IconData? suffixIcon,
  Function()? suffixPressed,
  void Function(String?)? onSaved,
  void Function(String)? onChanged,
  void Function(String)? onFieldSubmitted,
  bool obscureText = false,
  int? maxLines = 1,
  double? borderRadius = 30,
}) {
  return TextFormField(
    controller: controller,
    keyboardType: keyboardType,
    onSaved: onSaved,
    onChanged: onChanged,
    onFieldSubmitted: onFieldSubmitted,

    obscureText: obscureText,
    maxLines: maxLines,
    
    validator: (value) {
      if (value?.isEmpty ?? true) {
        return 'Field is required';
      } else {
        return null;
      }
    },
    decoration: InputDecoration(
      labelText: label,
      hintText: hint,
      filled: true,
      fillColor: AppColors.textHolder,
      prefixIcon: Icon(prefix),
      suffixIcon: suffixIcon != null
          ? IconButton(
              onPressed: suffixPressed,
              icon: Icon(
                suffixIcon,
                // color: Colors.grey,
              ))
          : null,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius!)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(color: Colors.white, width: 1)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: const BorderSide(color: Colors.white, width: 1)),
    ),
  );
}
