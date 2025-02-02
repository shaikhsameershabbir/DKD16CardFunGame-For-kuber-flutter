import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

void showSuccessDialog(
    BuildContext context, String msg, String drawTime, int winAmount) {
  showDialog(
    context: context,
    builder: (context) {
      return RawKeyboardListener(
        focusNode: FocusNode(), // Required for capturing key events
        autofocus: true, // Ensures the listener is active
        onKey: (RawKeyEvent event) {
          if (event is RawKeyDownEvent) {
            if (event.logicalKey == LogicalKeyboardKey.enter ||
                event.logicalKey == LogicalKeyboardKey.space) {
              Navigator.pop(context); // Close the dialog
            }
          }
        },
        child: Dialog(
          // Use Dialog instead of AlertDialog to remove extra padding
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(0)),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.4, // Adjust width
            // height: MediaQuery.of(context).size.height * 0.3,
            padding: EdgeInsets.all(0), // Remove padding
            child: Column(
              mainAxisSize: MainAxisSize
                  .min, // Ensure the column only takes necessary space
              children: [
                // Title Row
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  color: Colors
                      .grey[200], // Optional background color for title bar
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/logo/kuber_logo.png",
                        height: 30,
                      ),
                      SizedBox(width: 8),
                      Text('10 Ka Dum',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      Spacer(),
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image:
                                  AssetImage("assets/duskadam/closewindow.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Content
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Image.asset(
                      //   "assets/logo/kuber_logo.png",
                      //   height: 40,
                      // ),
                      SizedBox(width: 10),
                      Container(
                        // Allow text to take remaining space
                        child: Text(
                          // textAlign: TextAlign.center,
                          msg,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Text("drawTime"),
                      winAmount != 0
                          ? Text(
                              "Winning Amount:   ${winAmount.toString()}",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )
                          : Container(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // Actions (Button)
                Container(
                  // color: Colors.red,
                  width: double.infinity, // Make button row take full width
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  child: TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 120, // Make button take full width
                          height: 35,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.blue),
                          ),
                          child: Center(
                            child: Text(
                              "OK",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
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

// void showSuccessDialog(BuildContext context, String msg) {
//   showDialog(
//     context: context,
//     builder: (context) {
//       return AlertDialog(
//         backgroundColor: Colors.white, // Set background color to white
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.all(
//               Radius.circular(0)), // Remove rounded corners or adjust as needed
//         ),
//         title: Row(
//           children: [
//             Expanded(
//               child: Row(
//                 children: [
//                   Image.asset(
//                     "assets/logo/kuber_logo.png",
//                     height: 30,
//                   ),
//                   Text('10 Ka Dum'),
//                 ],
//               ),
//             ),
//             GestureDetector(
//               onTap: () {
//                 Navigator.of(context).pop(); // Close nested dialog
//                 // Navigator.of(context).pop(); //
//               },
//               child: Container(
//                 width: 25,
//                 height:
//                     25, // Ensure height is set to make the close icon square
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     image: AssetImage("assets/duskadam/closewindow.png"),
//                     fit: BoxFit.cover, // Ensure close icon fits the container
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//         content: SizedBox(
//           width: MediaQuery.of(context).size.width *
//               0.3, // Set the desired width for the dialog box
//           child: Row(
//             children: [
//               Image.asset(
//                 "assets/logo/kuber_logo.png",
//                 height: 40,
//               ),
//               Text(
//                 msg,
//                 style: TextStyle(
//                     fontSize: 12,
//                     fontWeight:
//                         FontWeight.bold), // Adjust the font size as needed
//               ),
//             ],
//           ),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop(); // Close nested dialog
//             },
//             child: Container(
//                 width: 120,
//                 height: 30,
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     border: Border.all(color: Colors.blue)),
//                 child: Center(
//                     child: Text(
//                   "OK",
//                   style: TextStyle(
//                       color: Colors.black, fontWeight: FontWeight.bold),
//                 ))),
//           ),
//         ],
//       );
//     },
//   );
// }
