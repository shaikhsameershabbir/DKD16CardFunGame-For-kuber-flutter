import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuber/cubit/balance_update_cubit.dart/balance_update_cubit.dart';
import 'package:kuber/widgets/custom_button.dart';
import 'package:sizer/sizer.dart';

void showPopup(
    BuildContext context,
    String inputText,
    double width,
    double height,
    int winAmount,
    int betTotal,
    String drawTime,
    String drawDate,
    int winner,
    String ticket,
    int xvalue,
    BalanceUpdateCubit balanceCubit) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      balanceCubit.initializeBalanceSocket();
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
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(1),
          ),
          child: SizedBox(
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
                      crossAxisAlignment: CrossAxisAlignment
                          .center, // Ensure vertical alignment
                      children: [
                        // Left container with image
                        Container(
                          width: width * 0.04,
                          height: height *
                              0.08, // Ensure the image height matches the parent container
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/logo/kuber_logo.png"),
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
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 15),
                      alignment: Alignment
                          .centerLeft, // Align the entire content to the left
                      width: double.infinity,
                      color: Color(0xFF333333),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment
                            .start, // Align all column children to the left
                        children: [
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: width * 0.2,
                                child: Text(
                                  'TICKET ID:',
                                  style: TextStyle(
                                      fontSize: 11.sp,
                                      color: Color(0xFFd0d0d0)),
                                  textAlign:
                                      TextAlign.left, // Align text to the left
                                ),
                              ),
                              Text(
                                '$inputText',
                                style: TextStyle(
                                    fontSize: 11.sp, color: Color(0xFFd0d0d0)),
                                textAlign:
                                    TextAlign.left, // Align text to the left
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: width * 0.2,
                                child: Text(
                                  'LUCKY NUMBER:',
                                  style: TextStyle(
                                      fontSize: 11.sp,
                                      color: Color(0xFFd0d0d0)),
                                  textAlign:
                                      TextAlign.left, // Align text to the left
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "$winner ",
                                    style: TextStyle(
                                        fontSize: 11.sp,
                                        color: Color(0xFFd0d0d0)),
                                    textAlign: TextAlign
                                        .left, // Align text to the left
                                  ),
                                  Text(
                                    xvalue > 1 ? "  ${xvalue}X" : "",
                                    style: TextStyle(
                                        fontSize: 11.sp,
                                        color: Color(0xFFd0d0d0)),
                                    textAlign: TextAlign
                                        .left, // Align text to the left
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: width * 0.2,
                                child: Text(
                                  'DRAW TIME:',
                                  style: TextStyle(
                                      fontSize: 11.sp,
                                      color: Color(0xFFd0d0d0)),
                                  textAlign:
                                      TextAlign.left, // Align text to the left
                                ),
                              ),
                              Text(
                                '$drawDate $drawTime',
                                style: TextStyle(
                                    fontSize: 11.sp, color: Color(0xFFd0d0d0)),
                                textAlign:
                                    TextAlign.left, // Align text to the left
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: width * 0.2,
                                child: Text(
                                  'WON POINTS:',
                                  style: TextStyle(
                                      fontSize: 11.sp,
                                      color: Color(0xFFd0d0d0)),
                                  textAlign:
                                      TextAlign.left, // Align text to the left
                                ),
                              ),
                              Text(
                                '$winAmount',
                                style: TextStyle(
                                    fontSize: 17.sp, color: Color(0xFFFFFFFF)),
                                textAlign:
                                    TextAlign.left, // Align text to the left
                              ),
                            ],
                          ),
                          Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment
                                .end, // Align the button to the right
                            children: [
                              CustomButton(
                                backgroundColor: Color(0xFFee9130),
                                buttonText: "OK",
                                onPressed: () {
                                  context
                                      .read<BalanceUpdateCubit>()
                                      .initializeBalanceSocket();
                                  Navigator.pop(context);
                                },
                                btnwidth: width * 0.05,
                                btnheight: height * 0.04,
                                borderRadius: 5,
                              ),
                              SizedBox(
                                width: 15,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
