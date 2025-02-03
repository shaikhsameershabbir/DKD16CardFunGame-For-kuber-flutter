// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:kuber/cubit/counter_sale_nettotpay_cubit/countersale_nettotpay_cubit.dart';
// import 'package:kuber/cubit/counter_sale_nettotpay_cubit/countersale_nettotpay_state.dart';
// import 'package:kuber/cubit/dkdWinner/dkd_winner_cubit.dart';
// import 'package:kuber/cubit/dkdWinner/dkd_winner_state.dart';
// import 'package:kuber/cubit/getandviewresultcubit/get_and_view_result_cubit.dart';
// import 'package:kuber/cubit/getandviewresultcubit/get_and_view_result_state.dart';
// import 'package:sizer/sizer.dart';

// class AccountScreenTable extends StatelessWidget {
//   final List<Map<String, Color>> colors = [
//     {'1': Color(0xFF74b273)},
//     {'2': Color(0xFFd1248f)},
//     {'3': Color(0xFFc0952c)},
//     {'4': Color(0xFF956eff)},
//     {'5': Color(0xFF80ba80)},
//     {'6': Color(0xFFdb38a3)},
//     {'7': Color(0xFFc9a449)},
//     {'8': Color(0xFFa17eff)},
//     {'9': Color(0xFF97c797)},
//     {'10': Color(0xFFe557b9)},
//     {'11': Color(0xFFd4b66e)},
//     {'12': Color(0xFFb499fe)},
//   ];

//   AccountScreenTable({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // Retrieve screen width using MediaQuery
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;

//     return BlocBuilder<GetAndViewResultCubit, GetAndViewResultState>(
//       builder: (context, resultCubitstate) {
//         if (resultCubitstate is ResultLoaded) {
//           return SizedBox(
//             width: screenWidth * 0.28,
//             height: screenHeight * 0.875,
//             child: SingleChildScrollView(
//               scrollDirection: Axis.vertical,
//               child: Table(
//                 border: TableBorder.all(color: Colors.white),
//                 columnWidths: {
//                   0: FlexColumnWidth(2), // Adjust column widths as needed
//                   1: FlexColumnWidth(2),
//                 },
//                 children: [
//                   // Header row
//                   TableRow(
//                     decoration: BoxDecoration(
//                         color: const Color.fromARGB(255, 186, 77, 38)),
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Center(
//                           child: Text(
//                             'Time',
//                             style: TextStyle(
//                                 fontFamily: 'Times New Roman',
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 19.sp,
//                                 decoration: TextDecoration.none,
//                                 color: Colors.white),
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Center(
//                           child: Text(
//                             'Result',
//                             style: TextStyle(
//                                 fontFamily: 'Times New Roman',
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 19.sp,
//                                 decoration: TextDecoration.none,
//                                 color: Colors.white),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   // Data rows
//                   for (int i = 0; i < resultCubitstate.results.length; i++)
//                     TableRow(
//                       decoration: BoxDecoration(
//                         color: _getColorForWinner(
//                             int.parse(resultCubitstate.results[i]['winner'])),
//                       ),
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Center(
//                             child: Text(
//                               resultCubitstate.results[i]['drawTime'],
//                               style: TextStyle(
//                                   fontFamily: 'Times New Roman',
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 16.sp,
//                                   decoration: TextDecoration.none,
//                                   color: Colors.black),
//                             ),
//                           ),
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Center(child:
//                                   BlocBuilder<DkdWinnerCubit, DkdWinnerState>(
//                             builder: (context, state) {
//                               if (state is DKDWinnerUpdated) {
//                                 return Text(
//                                   resultCubitstate.results[i]['xValue'] > 1
//                                       // ignore: prefer_interpolation_to_compose_strings
//                                       ? resultCubitstate.results[i]['winner']
//                                               .toString() +
//                                           " " +
//                                           resultCubitstate.results[i]['xValue']
//                                               .toString() +
//                                           'X'.toString()
//                                       : resultCubitstate.results[i]['winner'],
//                                   style: TextStyle(
//                                     fontFamily: 'Times New Roman',
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 16.sp,
//                                     decoration: TextDecoration.none,
//                                     color: Colors.black,
//                                   ),
//                                 );
//                               } else {
//                                 return Text(
//                                   resultCubitstate.results[i]['winner']
//                                       .toString(),
//                                   style: TextStyle(
//                                       fontFamily: 'Times New Roman',
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 16.sp,
//                                       decoration: TextDecoration.none,
//                                       color: Colors.black),
//                                 );
//                               }
//                             },
//                           )

//                               //  Text(
//                               //   state.results[i]['winner'].toString(),
//                               //   style: TextStyle(
//                               //       fontFamily: 'Times New Roman',
//                               //       fontWeight: FontWeight.bold,
//                               //       fontSize: 16.sp,
//                               //       decoration: TextDecoration.none,
//                               //       color: Colors.black),
//                               // ),
//                               ),
//                         ),
//                       ],
//                     ),
//                 ],
//               ),
//             ),
//           );
//         } else if (resultCubitstate is ResultLoadedInitial) {
//           return const Center(child: CircularProgressIndicator());
//         } else {
//           return const Center(child: Text("No data available"));
//         }
//       },
//     );
//   }

//   Color _getColorForWinner(int winner) {
//     final colorMap = colors.firstWhere(
//         (color) => color.containsKey(winner.toString()),
//         orElse: () => {'1': Colors.white});
//     return colorMap[winner.toString()] ?? Colors.white;
//   }
// }

// ///////////// below is old code //////////////////
// // class AccountScreenTable extends StatelessWidget {
// //   final List<Map<String, dynamic>> timeAndResults = [
// //     {'time': '12:18 PM', 'result': '3'},
// //     {'time': '12:15 PM', 'result': '5'},
// //     {'time': '12:12 PM', 'result': '5'},
// //     {'time': '12:09 PM', 'result': '5'},
// //     {'time': '12:06 PM', 'result': '9'},
// //     {'time': '12:03 PM', 'result': '8'},
// //     {'time': '12:00 PM', 'result': '8'},
// //     {'time': '11:57 AM', 'result': '6'},
// //     {'time': '11:54 AM', 'result': '11'},
// //     {'time': '11:51 AM', 'result': '12'},
// //     {'time': '11:48 AM', 'result': '7'},
// //     {'time': '11:45 AM', 'result': '8'},
// //   ];

// //   final List<Map<String, Color>> colors = [
// //     {'1': Color(0xFFc0952b)},
// //     {'2': Color(0xFF81ba81)},
// //     {'3': Color(0xFFdb38a3)},
// //     {'4': Color(0xFF81ba81)},
// //     {'5': Color(0xFFd1248e)},
// //     {'6': Color(0xFFd1248e)},
// //     {'7': Color(0xFFc0952b)},
// //     {'8': Color(0xFF81ba81)},
// //     {'9': Color(0xFFc0952b)},
// //     {'10': Color(0xFF956eff)},
// //     {'11': Color(0xFF956eff)},
// //     {'12': Color(0xFF956eff)},
// //   ];

// //   AccountScreenTable({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     // Retrieve screen width using MediaQuery
// //     double screenWidth = MediaQuery.of(context).size.width;
// //     double screenHeight = MediaQuery.of(context).size.height;

// //     return SizedBox(
// //       width: screenWidth * 0.28,
// //       height: screenHeight * 0.875,
// //       child: SingleChildScrollView(
// //         scrollDirection: Axis.vertical,
// //         child: Table(
// //           border:
// //               TableBorder.all(color: Colors.white), // Border around each cell
// //           columnWidths: {
// //             0: FlexColumnWidth(2), // Adjust column widths as needed
// //             1: FlexColumnWidth(2),
// //           },
// //           children: [
// //             // Header row
// //             TableRow(
// //               decoration:
// //                   BoxDecoration(color: const Color.fromARGB(255, 186, 77, 38)),
// //               children: [
// //                 Padding(
// //                   padding: const EdgeInsets.all(8.0),
// //                   child: Center(
// //                     child: Text(
// //                       'Time',
// //                       style: TextStyle(
// //                           fontFamily: 'Times New Roman',
// //                           fontWeight: FontWeight.bold,
// //                           fontSize: 19.sp,
// //                           decoration: TextDecoration.none,
// //                           color: Colors.white),
// //                     ),
// //                   ),
// //                 ),
// //                 Padding(
// //                   padding: const EdgeInsets.all(8.0),
// //                   child: Center(
// //                     child: Text(
// //                       'Result',
// //                       style: TextStyle(
// //                           fontFamily: 'Times New Roman',
// //                           fontWeight: FontWeight.bold,
// //                           fontSize: 19.sp,
// //                           decoration: TextDecoration.none,
// //                           color: Colors.white),
// //                     ),
// //                   ),
// //                 ),
// //               ],
// //             ),

// //             // Data rows
// //             for (int i = 0; i < timeAndResults.length; i++)
// //               TableRow(
// //                 decoration: BoxDecoration(
// //                   color: colors[i],
// //                 ),
// //                 children: [
// //                   Padding(
// //                     padding: const EdgeInsets.all(8.0),
// //                     child: Center(
// //                       child: Text(
// //                         timeAndResults[i]['time']!,
// //                         style: TextStyle(
// //                             fontFamily: 'Times New Roman',
// //                             fontWeight: FontWeight.bold,
// //                             fontSize: 16.sp,
// //                             decoration: TextDecoration.none,
// //                             color: Colors.black),
// //                       ),
// //                     ),
// //                   ),
// //                   Padding(
// //                     padding: const EdgeInsets.all(8.0),
// //                     child: Center(
// //                       child: Text(
// //                         timeAndResults[i]['result']!,
// //                         style: TextStyle(
// //                             fontFamily: 'Times New Roman',
// //                             fontWeight: FontWeight.bold,
// //                             fontSize: 16.sp,
// //                             decoration: TextDecoration.none,
// //                             color: Colors.black),
// //                       ),
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// ////////////// above code ended here /////////////////////////

// // Assuming that these classes are already defined somewhere
// // import 'countersale_nettotpay_cubit.dart';

// class AccountTable extends StatefulWidget {
//   const AccountTable({super.key});

//   @override
//   State<AccountTable> createState() => _AccountTableState();
// }

// class _AccountTableState extends State<AccountTable> {
//   final TextEditingController _fromDateController = TextEditingController();
//   final TextEditingController _toDateController = TextEditingController();

//   @override
//   void dispose() {
//     _fromDateController.dispose();
//     _toDateController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<CountersaleNettotpayCubit, CountersaleNettotpayState>(
//       builder: (context, state) {
//         Map<String, dynamic> data = {};
//         if (state is CountersaleNettotpayStateUpdated) {
//           data = state.data;
//         }

//         final totalUserBets = data['totalUserBets'] as Map<String, dynamic>?;

//         return Scaffold(
//           appBar: AppBar(
//             title: Text('Account'),
//             backgroundColor: Colors.cyan,
//             actions: [
//               IconButton(
//                 icon: Icon(Icons.close),
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//               ),
//             ],
//           ),
//           body: SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       ElevatedButton(
//                         onPressed: () {},
//                         style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.cyan),
//                         child: Text('Counter Sale'),
//                       ),
//                       SizedBox(width: 10),
//                       ElevatedButton(
//                         onPressed: () {},
//                         style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.grey[300]),
//                         child: Text('Net to pay'),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 20),
//                   Row(
//                     children: [
//                       Text('From '),
//                       SizedBox(
//                         width: 120,
//                         child: TextField(
//                           controller: _fromDateController,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(),
//                             contentPadding: EdgeInsets.symmetric(horizontal: 8),
//                           ),
//                         ),
//                       ),
//                       SizedBox(width: 10),
//                       Text(' To '),
//                       SizedBox(
//                         width: 120,
//                         child: TextField(
//                           controller: _toDateController,
//                           decoration: InputDecoration(
//                             border: OutlineInputBorder(),
//                             contentPadding: EdgeInsets.symmetric(horizontal: 8),
//                           ),
//                         ),
//                       ),
//                       SizedBox(width: 10),
//                       ElevatedButton(
//                         onPressed: () {
//                           // Implement submit logic
//                         },
//                         style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.amber),
//                         child: Text('Submit'),
//                       ),
//                       SizedBox(width: 10),
//                       ElevatedButton(
//                         onPressed: () {
//                           // Implement cancel logic
//                         },
//                         style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.orange),
//                         child: Text('Cancel'),
//                       ),
//                       SizedBox(width: 10),
//                       ElevatedButton(
//                         onPressed: () {
//                           // Implement print logic
//                         },
//                         style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.cyan),
//                         child: Text('Print'),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 20),
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Expanded(
//                         flex: 3,
//                         child: Container(
//                           decoration: BoxDecoration(
//                             border: Border.all(color: Colors.black),
//                             borderRadius: BorderRadius.circular(4),
//                           ),
//                           child: Table(
//                             border: TableBorder.all(),
//                             columnWidths: {
//                               0: FixedColumnWidth(60),
//                               1: FixedColumnWidth(100),
//                               2: FixedColumnWidth(80),
//                               3: FixedColumnWidth(80),
//                               4: FixedColumnWidth(80),
//                             },
//                             children: [
//                               TableRow(
//                                 children: [
//                                   headerCell('Sr.No'),
//                                   headerCell('Date'),
//                                   headerCell('Play'),
//                                   headerCell('Win'),
//                                   headerCell('Point'),
//                                 ],
//                               ),
//                               if (totalUserBets != null)
//                                 ...totalUserBets.entries.map((entry) {
//                                   final betData =
//                                       entry.value as Map<String, dynamic>;
//                                   final betTotal =
//                                       parseStringToInt(betData['betTotal']);
//                                   final winAmount =
//                                       parseStringToInt(betData['winAmount']);
//                                   return TableRow(
//                                     children: [
//                                       dataCell('1'),
//                                       dataCell(entry.key, isDate: true),
//                                       dataCell(betTotal.toString()),
//                                       dataCell(winAmount.toString()),
//                                       dataCell(
//                                           (betTotal - winAmount).toString()),
//                                     ],
//                                   );
//                                 }).toList(),
//                               TableRow(
//                                 decoration: BoxDecoration(color: Colors.orange),
//                                 children: [
//                                   dataCell(''),
//                                   dataCell('Total', bold: true),
//                                   dataCell(
//                                       parseStringToInt(data['playPoint'])
//                                           .toString(),
//                                       bold: true),
//                                   dataCell(
//                                       parseStringToInt(data['totalWinAmount'])
//                                           .toString(),
//                                       bold: true),
//                                   dataCell(
//                                       (parseStringToInt(data['playPoint']) -
//                                               parseStringToInt(
//                                                   data['totalWinAmount']))
//                                           .toString(),
//                                       bold: true),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       SizedBox(width: 20),
//                       Expanded(
//                         flex: 2,
//                         child: Container(
//                           padding: EdgeInsets.all(16),
//                           decoration: BoxDecoration(
//                             border: Border.all(color: Colors.black),
//                             borderRadius: BorderRadius.circular(4),
//                           ),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text('Game ID : 10KaDum',
//                                   style: TextStyle(fontSize: 16)),
//                               SizedBox(height: 10),
//                               Text('Counter sale',
//                                   style: TextStyle(fontSize: 16)),
//                               SizedBox(height: 10),
//                               Text('Retailer code: ${data['username'] ?? ''}'),
//                               SizedBox(height: 20),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text('2025-02-03'),
//                                   Text('To'),
//                                   Text('2025-02-03'),
//                                 ],
//                               ),
//                               Divider(color: Colors.black),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text('Play'),
//                                   Text(
//                                       '${parseStringToInt(data['playPoint'])}'),
//                                 ],
//                               ),
//                               SizedBox(height: 10),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text('Win'),
//                                   Text(
//                                       '- ${parseStringToInt(data['totalWinAmount'])}'),
//                                 ],
//                               ),
//                               Divider(color: Colors.black),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text('Outstanding'),
//                                   Text(
//                                       '${parseStringToInt(data['playPoint']) - parseStringToInt(data['totalWinAmount'])}'),
//                                 ],
//                               ),
//                               SizedBox(height: 20),
//                               Text(
//                                   'Server Time : ${DateTime.now().toString()}'),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }

//   Widget headerCell(String text) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Text(
//         text,
//         style: TextStyle(fontWeight: FontWeight.bold),
//         textAlign: TextAlign.center,
//       ),
//     );
//   }

//   Widget dataCell(String text, {bool bold = false, bool isDate = false}) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Text(
//         text,
//         style: TextStyle(
//           fontWeight: bold ? FontWeight.bold : FontWeight.normal,
//           color: isDate ? Colors.blue : Colors.black,
//           decoration: isDate ? TextDecoration.underline : TextDecoration.none,
//         ),
//         textAlign: TextAlign.center,
//       ),
//     );
//   }

//   int parseStringToInt(dynamic value) {
//     if (value == null) return 0;
//     if (value is int) return value;
//     if (value is String) return int.tryParse(value) ?? 0;
//     return 0;
//   }
// }
// // class AccountTable extends StatefulWidget {
// //   const AccountTable({super.key});

// //   @override
// //   State<AccountTable> createState() => _AccountTableState();
// // }

// // class _AccountTableState extends State<AccountTable> {
// //   Map<String, dynamic> data = {
// //     "totalUserBets": {
// //       "2025-02-03": {"betTotal": 420, "winAmount": 3410},
// //       "2025-02-02": {"betTotal": 220, "winAmount": 990},
// //       "2025-01-31": {"betTotal": 1050, "winAmount": 880},
// //       "2025-01-30": {"betTotal": 1720, "winAmount": 1650},
// //       "2025-01-29": {"betTotal": 3540, "winAmount": 2750},
// //       "point": -2730
// //     },
// //     "playPoint": 6950,
// //     "totalWinAmount": 9680,
// //     "username": "retailer",
// //     "userId": 60,
// //     "percentage": 10,
// //     "commission": 695,
// //     "netToPay": -3425
// //   };

// //   int totalPlayPoint = 0;
// //   int totalWinAmount = 0;

// //   @override
// //   Widget build(BuildContext context) {
// //     double screenWidth = MediaQuery.of(context).size.width;
// //     double screenHeight = MediaQuery.of(context).size.height;

// //     int totalBetTotal = 0;
// //     int totalWinAmount = 0;

// //     (data["totalUserBets"] as Map<String, dynamic>).forEach((key, value) {
// //       if (value is Map<String, dynamic>) {
// //         totalBetTotal += (value["betTotal"] as num?)?.toInt() ?? 0;
// //         totalWinAmount += (value["winAmount"] as num?)?.toInt() ?? 0;
// //       }
// //     });
    

// //     return Container(
// //       width: screenWidth * 0.6,
// //       height: screenHeight * 0.6,
// //       decoration: BoxDecoration(
// //         border: Border.all(color: Colors.black),
// //         borderRadius: BorderRadius.circular(1),
// //       ),
// //       padding: EdgeInsets.all(8),
// //       child: SingleChildScrollView(
// //         child: Table(
// //           columnWidths: {
// //             0: FixedColumnWidth(50), // Sr.No width
// //             1: FixedColumnWidth(100), // Date width
// //             2: FixedColumnWidth(60), // Play width
// //             3: FixedColumnWidth(60), // Win width
// //             4: FixedColumnWidth(60), // Point width
// //           },
// //           border: TableBorder.all(
// //             color: Colors.black,
// //             width: 1,
// //           ),
// //           children: [
// //             // Table header row
// //             TableRow(
// //               children: [
// //                 headerCell('Sr.No'),
// //                 headerCell('Date'),
// //                 headerCell('Play'),
// //                 headerCell('Win'),
// //                 headerCell('Point'),
// //               ],
// //             ),

         

// //             ...(data["totalUserBets"] as Map<String, dynamic>)
// //                 .entries
// //                 .where((entry) =>
// //                     entry.value is Map) // Ensure it's a map with bet data
// //                 .toList()
// //                 .asMap()
// //                 .map((index, entry) {
// //                   String date = entry.key;
// //                   int betTotal = entry.value["betTotal"];
// //                   int winAmount = entry.value["winAmount"];
// //                   int point = betTotal - winAmount; // Corrected this line

// //                   return MapEntry(
// //                     index,
// //                     TableRow(
// //                       children: [
// //                         dataCell((index + 1)
// //                             .toString()), // Increment index dynamically
// //                         dataCell(date, isDate: true),
// //                         dataCell(betTotal.toString()),
// //                         dataCell(winAmount.toString()),
// //                         dataCell(point
// //                             .toString()), // Correctly fetching 'point' from data
// //                       ],
// //                     ),
// //                   );
// //                 })
// //                 .values
// //                 .toList(),

// //             // Total row
// //             // TableRow(
// //             //   decoration: BoxDecoration(color: Colors.amber),
// //             //   children: [
// //             //     dataCell(''),
// //             //     dataCell('Total', bold: true),
// //             //     dataCell('120', bold: true),
// //             //     dataCell('${data['totalWinAmount']}', bold: true),
// //             //     dataCell('${data['playPoint']}', bold: true),
// //             //   ],
// //             // ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   Widget dataCell(String text, {bool bold = false, bool isDate = false}) {
// //     return Padding(
// //       padding: const EdgeInsets.all(8.0),
// //       child: Text(
// //         text,
// //         style: TextStyle(
// //           fontWeight: bold ? FontWeight.bold : FontWeight.normal,
// //           color: isDate ? Colors.blue : Colors.black, // Set blue for date cells
// //           decoration: isDate
// //               ? TextDecoration.underline
// //               : TextDecoration.none, // Underline for date cells
// //         ),
// //         textAlign: TextAlign.center,
// //       ),
// //     );
// //   }

// //   // Helper method for header cells
// //   Widget headerCell(String text) {
// //     return Padding(
// //       padding: const EdgeInsets.all(8.0),
// //       child: Text(
// //         text,
// //         style: TextStyle(fontWeight: FontWeight.bold),
// //         textAlign: TextAlign.center,
// //       ),
// //     );
// //   }
// // }
