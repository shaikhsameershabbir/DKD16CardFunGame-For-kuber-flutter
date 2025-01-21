import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color foregroundColor;
  final double fontSize;
  final double btnwidth;
  final double btnheight;
  final double borderRadius;
  final Color textColor;
// #
  const CustomButton(
      {super.key,
      required this.buttonText,
      required this.onPressed,
      this.backgroundColor = const Color.fromARGB(255, 5, 146, 66),
      this.foregroundColor = Colors.white,
      this.fontSize = 10,
      required this.btnwidth,
      required this.btnheight,
      required this.borderRadius,
      this.textColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      width: btnwidth, //screenWidth * 0.07,
      height: btnheight, //screenHeight * 0.05,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          minimumSize: const Size(double.infinity, 48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          ),
        ),
        child: Text(
          buttonText,
          style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: textColor),
        ),
      ),
    );
  }
}
