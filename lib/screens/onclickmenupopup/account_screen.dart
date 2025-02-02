import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuber/cubit/dkdWinner/dkd_winner_cubit.dart';
import 'package:kuber/cubit/dkdWinner/dkd_winner_state.dart';
import 'package:kuber/cubit/getandviewresultcubit/get_and_view_result_cubit.dart';
import 'package:kuber/cubit/getandviewresultcubit/get_and_view_result_state.dart';
import 'package:sizer/sizer.dart';

class AccountScreenTable extends StatelessWidget {
  final List<Map<String, Color>> colors = [
    {'1': Color(0xFF74b273)},
    {'2': Color(0xFFd1248f)},
    {'3': Color(0xFFc0952c)},
    {'4': Color(0xFF956eff)},
    {'5': Color(0xFF80ba80)},
    {'6': Color(0xFFdb38a3)},
    {'7': Color(0xFFc9a449)},
    {'8': Color(0xFFa17eff)},
    {'9': Color(0xFF97c797)},
    {'10': Color(0xFFe557b9)},
    {'11': Color(0xFFd4b66e)},
    {'12': Color(0xFFb499fe)},
  ];

  AccountScreenTable({super.key});

  @override
  Widget build(BuildContext context) {
    // Retrieve screen width using MediaQuery
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return BlocBuilder<GetAndViewResultCubit, GetAndViewResultState>(
      builder: (context, resultCubitstate) {
        if (resultCubitstate is ResultLoaded) {
          return SizedBox(
            width: screenWidth * 0.28,
            height: screenHeight * 0.875,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Table(
                border: TableBorder.all(color: Colors.white),
                columnWidths: {
                  0: FlexColumnWidth(2), // Adjust column widths as needed
                  1: FlexColumnWidth(2),
                },
                children: [
                  // Header row
                  TableRow(
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 186, 77, 38)),
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
                  for (int i = 0; i < resultCubitstate.results.length; i++)
                    TableRow(
                      decoration: BoxDecoration(
                        color: _getColorForWinner(
                            int.parse(resultCubitstate.results[i]['winner'])),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              resultCubitstate.results[i]['drawTime'],
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
                          child: Center(child:
                                  BlocBuilder<DkdWinnerCubit, DkdWinnerState>(
                            builder: (context, state) {
                              if (state is DKDWinnerUpdated) {
                                return Text(
                                  resultCubitstate.results[i]['xValue'] > 1
                                      ? resultCubitstate.results[i]['winner']
                                              .toString() +
                                          " " +
                                          resultCubitstate.results[i]['xValue']
                                              .toString() +
                                          'X'.toString()
                                      : resultCubitstate.results[i]['winner'],
                                  style: TextStyle(
                                    fontFamily: 'Times New Roman',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.sp,
                                    decoration: TextDecoration.none,
                                    color: Colors.black,
                                  ),
                                );
                              } else {
                                return Text(
                                  resultCubitstate.results[i]['winner']
                                      .toString(),
                                  style: TextStyle(
                                      fontFamily: 'Times New Roman',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.sp,
                                      decoration: TextDecoration.none,
                                      color: Colors.black),
                                );
                              }
                            },
                          )

                              //  Text(
                              //   state.results[i]['winner'].toString(),
                              //   style: TextStyle(
                              //       fontFamily: 'Times New Roman',
                              //       fontWeight: FontWeight.bold,
                              //       fontSize: 16.sp,
                              //       decoration: TextDecoration.none,
                              //       color: Colors.black),
                              // ),
                              ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          );
        } else if (resultCubitstate is ResultLoadedInitial) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const Center(child: Text("No data available"));
        }
      },
    );
  }

  Color _getColorForWinner(int winner) {
    final colorMap = colors.firstWhere(
        (color) => color.containsKey(winner.toString()),
        orElse: () => {'1': Colors.white});
    return colorMap[winner.toString()] ?? Colors.white;
  }
}

///////////// below is old code //////////////////
// class AccountScreenTable extends StatelessWidget {
//   final List<Map<String, dynamic>> timeAndResults = [
//     {'time': '12:18 PM', 'result': '3'},
//     {'time': '12:15 PM', 'result': '5'},
//     {'time': '12:12 PM', 'result': '5'},
//     {'time': '12:09 PM', 'result': '5'},
//     {'time': '12:06 PM', 'result': '9'},
//     {'time': '12:03 PM', 'result': '8'},
//     {'time': '12:00 PM', 'result': '8'},
//     {'time': '11:57 AM', 'result': '6'},
//     {'time': '11:54 AM', 'result': '11'},
//     {'time': '11:51 AM', 'result': '12'},
//     {'time': '11:48 AM', 'result': '7'},
//     {'time': '11:45 AM', 'result': '8'},
//   ];

//   final List<Map<String, Color>> colors = [
//     {'1': Color(0xFFc0952b)},
//     {'2': Color(0xFF81ba81)},
//     {'3': Color(0xFFdb38a3)},
//     {'4': Color(0xFF81ba81)},
//     {'5': Color(0xFFd1248e)},
//     {'6': Color(0xFFd1248e)},
//     {'7': Color(0xFFc0952b)},
//     {'8': Color(0xFF81ba81)},
//     {'9': Color(0xFFc0952b)},
//     {'10': Color(0xFF956eff)},
//     {'11': Color(0xFF956eff)},
//     {'12': Color(0xFF956eff)},
//   ];

//   AccountScreenTable({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // Retrieve screen width using MediaQuery
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;

//     return SizedBox(
//       width: screenWidth * 0.28,
//       height: screenHeight * 0.875,
//       child: SingleChildScrollView(
//         scrollDirection: Axis.vertical,
//         child: Table(
//           border:
//               TableBorder.all(color: Colors.white), // Border around each cell
//           columnWidths: {
//             0: FlexColumnWidth(2), // Adjust column widths as needed
//             1: FlexColumnWidth(2),
//           },
//           children: [
//             // Header row
//             TableRow(
//               decoration:
//                   BoxDecoration(color: const Color.fromARGB(255, 186, 77, 38)),
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Center(
//                     child: Text(
//                       'Time',
//                       style: TextStyle(
//                           fontFamily: 'Times New Roman',
//                           fontWeight: FontWeight.bold,
//                           fontSize: 19.sp,
//                           decoration: TextDecoration.none,
//                           color: Colors.white),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Center(
//                     child: Text(
//                       'Result',
//                       style: TextStyle(
//                           fontFamily: 'Times New Roman',
//                           fontWeight: FontWeight.bold,
//                           fontSize: 19.sp,
//                           decoration: TextDecoration.none,
//                           color: Colors.white),
//                     ),
//                   ),
//                 ),
//               ],
//             ),

//             // Data rows
//             for (int i = 0; i < timeAndResults.length; i++)
//               TableRow(
//                 decoration: BoxDecoration(
//                   color: colors[i],
//                 ),
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Center(
//                       child: Text(
//                         timeAndResults[i]['time']!,
//                         style: TextStyle(
//                             fontFamily: 'Times New Roman',
//                             fontWeight: FontWeight.bold,
//                             fontSize: 16.sp,
//                             decoration: TextDecoration.none,
//                             color: Colors.black),
//                       ),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Center(
//                       child: Text(
//                         timeAndResults[i]['result']!,
//                         style: TextStyle(
//                             fontFamily: 'Times New Roman',
//                             fontWeight: FontWeight.bold,
//                             fontSize: 16.sp,
//                             decoration: TextDecoration.none,
//                             color: Colors.black),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
////////////// above code ended here /////////////////////////

class AccountTable extends StatelessWidget {
  const AccountTable({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: screenWidth * 0.6,
      height: screenHeight * 0.6,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(1),
      ),
      padding: EdgeInsets.all(8),
      child: SingleChildScrollView(
        child: Table(
          columnWidths: {
            0: FixedColumnWidth(50), // Sr.No width
            1: FixedColumnWidth(100), // Date width
            2: FixedColumnWidth(60), // Play width
            3: FixedColumnWidth(60), // Win width
            4: FixedColumnWidth(60), // Point width
          },
          border: TableBorder.all(
            color: Colors.black,
            width: 1,
          ),
          children: [
            // Table header row
            TableRow(
              children: [
                headerCell('Sr.No'),
                headerCell('Date'),
                headerCell('Play'),
                headerCell('Win'),
                headerCell('Point'),
              ],
            ),
            // Data row
            TableRow(
              children: [
                dataCell('1'),
                dataCell('21-01-2025', isDate: true),
                dataCell('120'),
                dataCell('0'),
                dataCell('120'),
              ],
            ),
            // Total row
            TableRow(
              decoration: BoxDecoration(color: Colors.amber),
              children: [
                dataCell(''),
                dataCell('Total', bold: true),
                dataCell('120', bold: true),
                dataCell('0', bold: true),
                dataCell('120', bold: true),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget dataCell(String text, {bool bold = false, bool isDate = false}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: bold ? FontWeight.bold : FontWeight.normal,
          color: isDate ? Colors.blue : Colors.black, // Set blue for date cells
          decoration: isDate
              ? TextDecoration.underline
              : TextDecoration.none, // Underline for date cells
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  // Helper method for header cells
  Widget headerCell(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }

  // Helper method for data cells
}
// final List<Map<String, Color>> colors = [
//   {'1': Color(0xFFc0952b)},
//   {'2': Color(0xFF81ba81)},
//   {'3': Color(0xFFdb38a3)},
//   {'4': Color(0xFF81ba81)},
//   {'5': Color(0xFFd1248e)},
//   {'6': Color(0xFFd1248e)},
//   {'7': Color(0xFFc0952b)},
//   {'8': Color(0xFF81ba81)},
//   {'9': Color(0xFFc0952b)},
//   {'10': Color(0xFF956eff)},
//   {'11': Color(0xFF956eff)},
//   {'12': Color(0xFF956eff)},
// ];
