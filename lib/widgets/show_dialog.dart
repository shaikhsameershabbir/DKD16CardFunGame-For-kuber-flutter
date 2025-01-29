import 'package:flutter/material.dart';

void showSuccessDialog(BuildContext context, String msg) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.white, // Set background color to white
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
              Radius.circular(0)), // Remove rounded corners or adjust as needed
        ),
        title: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  Image.asset(
                    "assets/logo/kuber_logo.png",
                    height: 30,
                  ),
                  Text('10 Ka Dum'),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop(); // Close nested dialog
                Navigator.of(context).pop(); //
              },
              child: Container(
                width: 25,
                height:
                    25, // Ensure height is set to make the close icon square
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/duskadam/closewindow.png"),
                    fit: BoxFit.cover, // Ensure close icon fits the container
                  ),
                ),
              ),
            )
          ],
        ),
        content: SizedBox(
          width: MediaQuery.of(context).size.width *
              0.3, // Set the desired width for the dialog box
          child: Row(
            children: [
              Image.asset(
                "assets/logo/kuber_logo.png",
                height: 40,
              ),
              Text(
                msg,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight:
                        FontWeight.bold), // Adjust the font size as needed
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(); // Close nested dialog
              Navigator.of(context).pop(); //
            },
            child: Container(
                width: 120,
                height: 30,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.blue)),
                child: Center(
                    child: Text(
                  "OK",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ))),
          ),
        ],
      );
    },
  );
}
