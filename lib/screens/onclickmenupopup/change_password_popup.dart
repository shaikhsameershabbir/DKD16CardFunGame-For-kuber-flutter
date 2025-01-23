import 'package:flutter/material.dart';
import 'package:kuber/widgets/custom_button.dart';
import 'package:sizer/sizer.dart';

void showChangePasswordDialog(
    BuildContext context, double width, double height) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        child: Container(
          width: width * 0.70, // Set the desired width
          height: height * 0.52, // Set the desired height
          color: Color(0xFF87ceea),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header Section
              Container(
                  color: Color(0xFF14b8b1),
                  // padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center, // Center the text
                    children: [
                      Expanded(
                        child: Text(
                          "CHANGE PASSWORD",
                          textAlign: TextAlign
                              .center, // Ensure text is centered within the Expanded widget
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: const Icon(Icons.close, color: Colors.red),
                      ),
                    ],
                  )),
              // Input Fields
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    // Old Password
                    SizedBox(
                      width: width * 0.30, // Set the desired width
                      height: height * 0.10, // Set the desired height
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.cyan,
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: TextField(
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  labelText: "        Old Password",
                                  border: InputBorder.none,
                                  // contentPadding: const EdgeInsets.all(10),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                              child: Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: TextField(
                              style: TextStyle(fontSize: 15, height: 25 / 15),
                              textAlignVertical: TextAlignVertical
                                  .center, // Centers the text vertically
                              decoration: InputDecoration(
                                labelText: "",
                                border: InputBorder.none,
                              ),
                            ),
                          )),
                        ],
                      ),
                    ),
                    // const SizedBox(height: 20),
                    // New Password

                    const SizedBox(height: 20),
                    SizedBox(
                      width: width * 0.30, // Set the desired width
                      height: height * 0.10, // Set the desired height
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.cyan,
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: TextField(
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                  labelText: "        New Password",
                                  border: InputBorder.none,
                                  contentPadding: const EdgeInsets.all(10),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: "",
                                  border: InputBorder.none,
                                  contentPadding: const EdgeInsets.all(10),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Buttons
                    SizedBox(
                      width: width * 0.30, // Set the desired width
                      height: height * 0.10, // Set the desired height
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomButton(
                            fontWeight: FontWeight.bold,
                            fontSize: 10.sp,
                            backgroundColor: Color(0xFFccc31c),
                            buttonText: "Submit",
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            btnwidth: width * 0.07,
                            btnheight: height * 0.05,
                            borderRadius: 5,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          CustomButton(
                            fontWeight: FontWeight.bold,
                            fontSize: 10.sp,
                            backgroundColor: Color(0xFFd57d2b),
                            buttonText: "Cancel",
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            btnwidth: width * 0.07,
                            btnheight: height * 0.05,
                            borderRadius: 5,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Footer Section
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.all(1),
                    child: Text(
                      "Keep Changing Your Password",
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
