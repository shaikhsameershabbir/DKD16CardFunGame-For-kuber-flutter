import 'package:flutter/material.dart';
import 'package:kuber/widgets/custom_button.dart';
import 'package:sizer/sizer.dart';

void showPopup(
    BuildContext context, String inputText, double width, double height) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Color(0xFF87ceea),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(1),
        ),
        child: Container(
          // color: Colors.green,
          width: width * 0.35, // Set the desired width
          height: height * 0.38, // Set the desired height
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: height * 0.08,
                  color: const Color(0xFF248325),
                  child: Row(
                    crossAxisAlignment:
                        CrossAxisAlignment.center, // Ensure vertical alignment
                    children: [
                      // Left container with image
                      Container(
                        width: width * 0.04,
                        height: height *
                            0.08, // Ensure the image height matches the parent container
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/logo/logo.png"),
                            fit: BoxFit
                                .contain, // Adjust the image fit as needed
                          ),
                        ),
                      ),
                      // Center text
                      Expanded(
                        child: Center(
                          child: Text(
                            "CONGRATULATIONS!!!!",
                            style: const TextStyle(
                              color: Color(0xFFda4939),
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      // Right container
                      Container(
                        width: width * 0.04,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
