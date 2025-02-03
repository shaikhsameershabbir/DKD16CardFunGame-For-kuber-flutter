import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:kuber/cubit/getandviewresultcubit/get_and_view_result_cubit.dart';
import 'package:kuber/cubit/getandviewresultcubit/get_and_view_result_state.dart';

void showResultDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => const ResultDialog(),
  );
}

class ResultDialog extends StatefulWidget {
  const ResultDialog({super.key});

  @override
  State<ResultDialog> createState() => _ResultDialogState();
}

class _ResultDialogState extends State<ResultDialog> {
  DateTime? selectedDate;
  late String newSelectedDate;

  @override
  void initState() {
    // TODO: implement initState
    getTodaysResultListByDate();
    super.initState();
  }

  void getTodaysResultListByDate() {
    newSelectedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
    print("data from patti button $newSelectedDate");
    context
        .read<GetAndViewResultCubit>()
        .initializeGetResultsSocket(newSelectedDate);
  }

  Future<void> pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        print("picked date $picked");

        newSelectedDate = DateFormat('yy-MM-dd').format(picked);
        print("new selected date $newSelectedDate");

        print("------------------------ hitted 1 -------------------------");
        context
            .read<GetAndViewResultCubit>()
            .initializeGetResultsSocket(newSelectedDate);
        print("------------------------ hitted 2 -------------------------");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.lightBlue[100],
      child: Container(
        width: MediaQuery.of(context).size.width * 0.95,
        height: MediaQuery.of(context).size.height * 0.9,
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              color: Colors.teal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'RESULT',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: const Text(
                      'X',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),

            // Date and View Button
            GestureDetector(
              onTap: () => pickDate(context),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    const Text('Date: ', style: TextStyle(fontSize: 16)),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.cyan[100],
                        border: Border.all(color: Colors.black),
                      ),
                      child: Text(
                        selectedDate != null ? newSelectedDate : 'Select Date',
                        style: const TextStyle(fontSize: 13),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 4),
                      color: Colors.yellow,
                      child: const Text(
                        'View Result',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),

            // Date Header
            Container(
              color: Colors.grey[300],
              padding: const EdgeInsets.all(8),
              child: Center(
                child: Text(
                  newSelectedDate,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),

            // Results Grid
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.67,
                  child: ResultGrid(resultDate: newSelectedDate)),
            ),
          ],
        ),
      ),
    );
  }
}

// class ResultGrid extends StatefulWidget {
//   final String resultDate;
//   const ResultGrid({Key? key, required this.resultDate}) : super(key: key);

//   @override
//   State<ResultGrid> createState() => _ResultGridState();
// }

// class _ResultGridState extends State<ResultGrid> {
//   static const int columnsCount = 10; // Fixed number of columns per row

//   @override
//   void initState() {
//     super.initState();
//     context
//         .read<GetAndViewResultCubit>()
//         .initializeGetResultsSocket(widget.resultDate);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<GetAndViewResultCubit, GetAndViewResultState>(
//       builder: (context, state) {
//         if (state is ResultLoaded) {
//           final results = state.results;
//           final int rowsCount =
//               (results.length / columnsCount).ceil(); // Ensure all items fit

//           return SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Column(
//               children: List.generate(rowsCount, (rowIndex) {
//                 return Row(
//                   children: List.generate(columnsCount, (columnIndex) {
//                     final itemIndex = rowIndex * columnsCount + columnIndex;

//                     if (itemIndex >= results.length) {
//                       return _buildEmptyCell(); // Empty cell if no more data
//                     }

//                     final item = results[itemIndex];
//                     return _buildCell(item, rowIndex.isEven);
//                   }),
//                 );
//               }),
//             ),
//           );
//         } else if (state is ResultLoadedInitial) {
//           return const Center(child: CircularProgressIndicator());
//         } else {
//           return const Center(child: Text("No data available"));
//         }
//       },
//     );
//   }

//   Widget _buildCell(Map<String, dynamic> item, bool isEvenRow) {
//     final content = isEvenRow
//         ? item['drawTime']
//         : item['xValue'] > 1
//             ? "${item['winner']} ${item['xValue']}X"
//             : item['winner'].toString();

//     return Container(
//       width: 100, // Fixed cell width
//       padding: const EdgeInsets.all(8),
//       decoration: BoxDecoration(
//         color: isEvenRow ? Colors.grey[300] : Colors.white,
//         border: Border.all(color: Colors.black),
//       ),
//       child: Text(
//         content,
//         textAlign: TextAlign.center,
//         style: const TextStyle(fontSize: 14),
//       ),
//     );
//   }

//   Widget _buildEmptyCell() {
//     return Container(
//       width: 100,
//       height: 40,
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.black),
//       ),
//     );
//   }
// }

/////////////////////// 2/////////////////
// class ResultGrid extends StatefulWidget {
//   final String resultDate;
//   const ResultGrid({super.key, required this.resultDate});

//   @override
//   State<ResultGrid> createState() => _ResultGridState();
// }

// class _ResultGridState extends State<ResultGrid> {
//   @override
//   void initState() {
//     super.initState();
//     context
//         .read<GetAndViewResultCubit>()
//         .initializeGetResultsSocket(widget.resultDate);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<GetAndViewResultCubit, GetAndViewResultState>(
//       builder: (context, state) {
//         if (state is ResultLoaded) {
//           final results = state.results;

//           return SingleChildScrollView(
//             scrollDirection: Axis.vertical,
//             child: Table(
//               border: TableBorder.all(color: Colors.black),
//               columnWidths: {
//                 for (int i = 0; i < 10; i++) i: const FixedColumnWidth(100),
//               },
//               children: List.generate(
//                 (results.length / 10).ceil(), // Ensure all rows are created
//                 (rowIndex) {
//                   return TableRow(
//                     children: List.generate(10, (columnIndex) {
//                       int itemIndex = rowIndex * 10 + columnIndex;
//                       if (itemIndex >= results.length) {
//                         return _buildCell(
//                             "", Colors.white); // Empty cell for padding
//                       }

//                       final item = results[itemIndex];

//                       // **Even Rows -> Show Draw Time**
//                       if (rowIndex.isEven) {
//                         return _buildCell(item['drawTime'], Colors.grey[300]);
//                       }
//                       // **Odd Rows -> Show Winner with X Value if >1**
//                       else {
//                         String winnerText = item['winner'].toString();
//                         if (item['xValue'] > 1) {
//                           winnerText += " ${item['xValue']}X";
//                         }
//                         return _buildCell(winnerText, Colors.white);
//                       }
//                     }),
//                   );
//                 },
//               ),
//             ),
//           );
//         } else if (state is ResultLoadedInitial) {
//           return const Center(child: CircularProgressIndicator());
//         } else {
//           return const Center(child: Text("No data available"));
//         }
//       },
//     );
//   }

//   Widget _buildCell(String value, Color? bgColor) {
//     return Container(
//       padding: const EdgeInsets.all(8),
//       color: bgColor,
//       child: Text(
//         value,
//         textAlign: TextAlign.center,
//         style: const TextStyle(fontSize: 14),
//       ),
//     );
//   }
// }

///////////////////////// 3////////////////////////////
class ResultGrid extends StatefulWidget {
  final String resultDate;
  const ResultGrid({super.key, required this.resultDate});

  @override
  State<ResultGrid> createState() => _ResultGridState();
}

class _ResultGridState extends State<ResultGrid> {
  @override
  void initState() {
    super.initState();
    context
        .read<GetAndViewResultCubit>()
        .initializeGetResultsSocket(widget.resultDate);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAndViewResultCubit, GetAndViewResultState>(
      builder: (context, state) {
        if (state is ResultLoaded) {
          final results = state.results;

          List<TableRow> tableRows = [
            // **Header Row**
            TableRow(
              decoration: BoxDecoration(color: Colors.blue[200]),
              children: [
                _buildCell("Draw Time", Colors.blue[300], isHeader: true),
                _buildCell("Winner", Colors.blue[300], isHeader: true),
              ],
            ),
          ];

          // **Loop through each result and create a row**
          for (var item in results) {
            String winnerText = item['winner'].toString();
            if (item['xValue'] > 1) {
              winnerText += " ${item['xValue']}X";
            }

            tableRows.add(
              TableRow(
                children: [
                  _buildCell(item['drawTime'], Colors.grey[300]),
                  _buildCell(winnerText, Colors.white),
                ],
              ),
            );
          }

          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Table(
              border: TableBorder.all(color: Colors.black),
              columnWidths: {
                0: const FixedColumnWidth(150), // Draw Time Column
                1: const FixedColumnWidth(100), // Winner Column
              },
              children: tableRows,
            ),
          );
        } else if (state is ResultLoadedInitial) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const Center(child: Text("No data available"));
        }
      },
    );
  }

  Widget _buildCell(String value, Color? bgColor, {bool isHeader = false}) {
    return Container(
      padding: const EdgeInsets.all(8),
      color: bgColor,
      child: Text(
        value,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: isHeader ? 16 : 14,
          fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
