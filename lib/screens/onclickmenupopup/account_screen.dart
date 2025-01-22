import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ColoredResultTable extends StatelessWidget {
  final List<Map<String, String>> timeAndResults = [
    {'time': '12:18 PM', 'result': '3'},
    {'time': '12:15 PM', 'result': '5'},
    {'time': '12:12 PM', 'result': '5'},
    {'time': '12:09 PM', 'result': '5'},
    {'time': '12:06 PM', 'result': '9'},
    {'time': '12:03 PM', 'result': '8 5X'},
    {'time': '12:00 PM', 'result': '8'},
    {'time': '11:57 AM', 'result': '6'},
    {'time': '11:54 AM', 'result': '11'},
    {'time': '11:51 AM', 'result': '12'},
    {'time': '11:48 AM', 'result': '7'},
    {'time': '11:45 AM', 'result': '8'},
    {'time': '11:42 AM', 'result': '9'},
    {'time': '11:39 AM', 'result': '9'},
    {'time': '11:37 AM', 'result': '8'},
    {'time': '11:32 AM', 'result': '6'},
    {'time': '11:28 AM', 'result': '7'},
    {'time': '12:18 PM', 'result': '3'},
    {'time': '12:15 PM', 'result': '5'},
    {'time': '12:12 PM', 'result': '5'},
    {'time': '12:09 PM', 'result': '5'},
    {'time': '12:06 PM', 'result': '9'},
    {'time': '12:03 PM', 'result': '8 5X'},
    {'time': '12:00 PM', 'result': '8'},
    {'time': '11:57 AM', 'result': '6'},
    {'time': '11:54 AM', 'result': '11'},
    {'time': '11:51 AM', 'result': '12'},
    {'time': '11:48 AM', 'result': '7'},
    {'time': '11:45 AM', 'result': '8'},
    {'time': '11:42 AM', 'result': '9'},
    {'time': '11:39 AM', 'result': '9'},
    {'time': '11:37 AM', 'result': '8'},
    {'time': '11:32 AM', 'result': '6'},
    {'time': '11:28 AM', 'result': '7'},
  ];

  final List<Color> colors = [
    Color(0xFFc0952b),
    Color(0xFF81ba81),
    Color(0xFFdb38a3),
    Color(0xFF81ba81),
    Color(0xFFd1248e),
    Color(0xFFd1248e),
    Color(0xFFc0952b),
    Color(0xFF81ba81),
    Color(0xFFc0952b),
    Color(0xFF956eff),
    Color(0xFF956eff),
    Color(0xFF956eff),
    Color(0xFFd1248e),
    Color(0xFF73b273),
    Color(0xFF97c697),
    Color(0xFF956eff),
    Color(0xFFd4b66e),
    Color(0xFFc0952b),
    Color(0xFF81ba81),
    Color(0xFFdb38a3),
    Color(0xFF81ba81),
    Color(0xFFd1248e),
    Color(0xFFd1248e),
    Color(0xFFc0952b),
    Color(0xFF81ba81),
    Color(0xFFc0952b),
    Color(0xFF956eff),
    Color(0xFF956eff),
    Color(0xFF956eff),
    Color(0xFFd1248e),
    Color(0xFF73b273),
    Color(0xFF97c697),
    Color(0xFF956eff),
    Color(0xFFd4b66e),
  ];

  ColoredResultTable({super.key});

  @override
  Widget build(BuildContext context) {
    // Retrieve screen width using MediaQuery
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      width: screenWidth * 0.28,
      height: screenHeight * 0.912,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Table(
          border:
              TableBorder.all(color: Colors.white), // Border around each cell
          columnWidths: {
            0: FlexColumnWidth(2), // Adjust column widths as needed
            1: FlexColumnWidth(2),
          },
          children: [
            // Header row
            TableRow(
              decoration:
                  BoxDecoration(color: const Color.fromARGB(255, 186, 77, 38)),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      'Time',
                      style: TextStyle(
                          fontFamily: 'Times New Roman',
                          fontWeight: FontWeight.bold,
                          fontSize: 19.sp,
                          decoration: TextDecoration.none,
                          color: Colors.white),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      'Result',
                      style: TextStyle(
                          fontFamily: 'Times New Roman',
                          fontWeight: FontWeight.bold,
                          fontSize: 19.sp,
                          decoration: TextDecoration.none,
                          color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),

            // Data rows
            for (int i = 0; i < timeAndResults.length; i++)
              TableRow(
                decoration: BoxDecoration(
                  color: colors[i],
                ),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        timeAndResults[i]['time']!,
                        style: TextStyle(
                            fontFamily: 'Times New Roman',
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                            decoration: TextDecoration.none,
                            color: Colors.black),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        timeAndResults[i]['result']!,
                        style: TextStyle(
                            fontFamily: 'Times New Roman',
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                            decoration: TextDecoration.none,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

// final List<Color> colors = [
//   Color(0xFFc0952b),
//   Color(0xFF81ba81),
//   Color(0xFFdb38a3),
//   Color(0xFF81ba81),
//   Color(0xFFd1248e),
//   Color(0xFFd1248e),
//   Color(0xFFc0952b),
//   Color(0xFF81ba81),
//   Color(0xFFc0952b),
//   Color(0xFF956eff),
//   Color(0xFF956eff),
//   Color(0xFF956eff),
//   Color(0xFFd1248e),
//   Color(0xFF73b273),
//   Color(0xFF97c697),
//   Color(0xFF956eff),
//   Color(0xFFd4b66e),
// ];
