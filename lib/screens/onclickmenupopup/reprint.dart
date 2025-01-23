import 'package:flutter/material.dart';
import 'package:kuber/widgets/custom_button.dart';
import 'package:sizer/sizer.dart';

void reprintDialog(BuildContext context, double width, double height) {
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
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center, // Center the text
                    children: [
                      Expanded(
                        child: Text(
                          "REPRINT",
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
              SizedBox(
                height: 20,
              ),
              ReprintMenuTable()
            ],
          ),
        ),
      );
    },
  );
}

class ReprintMenuTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: screenWidth * 0.6,
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
                color: Color(0xFF87CEEB), // Light blue color
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
                        buttonText: "Reprint",
                        onPressed: () {},
                        btnwidth: screenWidth * 0.07,
                        btnheight: screenHeight * 0.07,
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
