import 'package:flutter/material.dart';
import 'package:kuber/widgets/custom_button.dart';
import 'package:sizer/sizer.dart';

void cancelDialog(BuildContext context, double width, double height) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        child: Container(
          width: width * 0.70, // Set the desired width
          height: height * 0.52, // Set the desired height
          color: Colors.white,

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header Section
              Container(
                width: width * 0.9,
                height: height * 0.05,
                color: Color(0xFF5499c7),
                child: Row(
                  children: [
                    SizedBox(width: 60, height: 60),
                    Spacer(),
                    Text(
                      "CANCEL",
                      style: TextStyle(
                          fontSize: 15.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context); // Close the dialog
                      },
                      child: Image.asset("assets/duskadam/closewindow.png"),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CancelMenuTable()
            ],
          ),
        ),
      );
    },
  );
}

class CancelMenuTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: screenWidth * 0.6,
      color: Colors.white,
      child: SingleChildScrollView(
        child: Table(
          border: TableBorder.all(
            color: Colors.grey,
            width: 0.5,
          ),
          columnWidths: {
            0: FlexColumnWidth(0.5), // Sr.No
            1: FlexColumnWidth(1.2), // Ticket Id
            2: FlexColumnWidth(1.2), // Draw Date
            3: FlexColumnWidth(1.2), // Draw Time
            4: FlexColumnWidth(1.0), // Total Points
            5: FlexColumnWidth(0.8), // Action
          },
          children: [
            // Header Row
            TableRow(
              decoration: BoxDecoration(
                color: Color(0xFF87ceea), // Light blue color
              ),
              children: [
                TableCell(child: _buildHeaderCell('Sr.No')),
                TableCell(child: _buildHeaderCell('Ticket Id')),
                TableCell(child: _buildHeaderCell('Draw Date')),
                TableCell(child: _buildHeaderCell('Draw Time')),
                TableCell(child: _buildHeaderCell('Total Points')),
                TableCell(child: _buildHeaderCell('Action')),
              ],
            ),
            // Data Row
            TableRow(
              decoration: BoxDecoration(color: Colors.white),
              children: [
                TableCell(child: _buildDataCell('1')),
                TableCell(child: _buildDataCell('83677711')),
                TableCell(child: _buildDataCell('21-01-2025')),
                TableCell(child: _buildDataCell('03:45 PM')),
                TableCell(child: _buildDataCell('30')),
                TableCell(
                  child: Container(
                    // padding: EdgeInsets.all(8),

                    child: CustomButton(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.bold,
                        backgroundColor: Color(0xFFccc51c),
                        buttonText: "Cancel",
                        onPressed: () {},
                        btnwidth: screenWidth * 0.07,
                        btnheight: screenHeight * 0.05,
                        borderRadius: 0),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderCell(String text) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildDataCell(String text) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Text(
        text,
        textAlign: TextAlign.center,
      ),
    );
  }
}
