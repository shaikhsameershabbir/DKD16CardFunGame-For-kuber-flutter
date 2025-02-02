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

  String newSelectedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());

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

        context
            .read<GetAndViewResultCubit>()
            .initializeGetResultsSocket(newSelectedDate);
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
            ResultGrid(resultDate: newSelectedDate),
          ],
        ),
      ),
    );
  }
}

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
    // context
    //     .read<GetAndViewResultCubit>()
    //     .initializeGetResultsSocket(widget.resultDate);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAndViewResultCubit, GetAndViewResultState>(
      builder: (context, state) {
        if (state is ResultLoaded) {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Table(
              border: TableBorder.all(color: Colors.black),
              columnWidths: const {
                0: FixedColumnWidth(100),
                1: FixedColumnWidth(100),
                2: FixedColumnWidth(100),
                3: FixedColumnWidth(100),
                4: FixedColumnWidth(100),
                5: FixedColumnWidth(100),
                6: FixedColumnWidth(100),
                7: FixedColumnWidth(100),
                8: FixedColumnWidth(100),
                9: FixedColumnWidth(100),
              },
              children: List.generate(state.results.length ~/ 10, (rowIndex) {
                // Create a row for every 10 items
                final startIndex = rowIndex * 10;
                final endIndex = startIndex + 10;
                final rowItems = state.results.sublist(startIndex, endIndex);

                return TableRow(
                  children: List.generate(10, (columnIndex) {
                    final itemIndex = rowIndex * 10 + columnIndex;
                    final item = rowItems[columnIndex];

                    if (rowIndex.isEven) {
                      return _buildCell(item['drawTime'], Colors.grey[300]);
                    } else {
                      // return _buildCell(
                      //     item['winner'].toString(), Colors.white);

                      return _buildCell(
                          state.results[itemIndex]['xValue'] > 1
                              ? state.results[itemIndex]['winner'].toString() +
                                  " " +
                                  state.results[itemIndex]['xValue']
                                      .toString() +
                                  'X'.toString()
                              : state.results[itemIndex]['winner'],
                          Colors.white);
                    }
                  }),
                );
              }),
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

  Widget _buildCell(String value, Color? bgColor) {
    return Container(
      padding: const EdgeInsets.all(8),
      color: bgColor,
      child: Text(
        value,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 14),
      ),
    );
  }
}
