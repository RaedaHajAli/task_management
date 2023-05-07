import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {this.onTap, required this.text, this.backgroundcolor, this.textColor});
  final String? text;

  final VoidCallback? onTap;
  final Color? backgroundcolor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.maxFinite,
        height: MediaQuery.of(context).size.height / 15,
        decoration: BoxDecoration(
            color: backgroundcolor ?? Colors.blueGrey,
            borderRadius: BorderRadius.circular(40)),
        alignment: Alignment.center,
        child: Text('$text',
            style: TextStyle(
                fontSize: 24, color: textColor, fontWeight: FontWeight.w400)),
      ),
    );
  }
}
