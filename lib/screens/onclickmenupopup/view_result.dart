import 'dart:math';
import 'package:flutter/material.dart';

void showResultDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => const ResultDialog(),
  );
}

class ResultDialog extends StatelessWidget {
  const ResultDialog({super.key});

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
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  const Text('Date: ', style: TextStyle(fontSize: 16)),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.cyan[100],
                      border: Border.all(color: Colors.black),
                    ),
                    child: const Text('24-01-2025'),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
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
            const SizedBox(height: 8),

            // Date Header
            Container(
              color: Colors.grey[300],
              padding: const EdgeInsets.all(8),
              child: const Center(
                child: Text(
                  '24-01-2025',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),

            // Results Grid
            Expanded(
              child: SingleChildScrollView(
                child: ResultGrid(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ResultGrid extends StatelessWidget {
  ResultGrid({super.key});

  final List<List<TimeSlotData>> timeSlots = List.generate(
    24, // 24 rows: alternating time and random values
    (index) {
      if (index % 2 == 0) {
        // Time row
        return _createTimeRow(index ~/ 2);
      } else {
        // Random numbers row
        return _createRandomRow();
      }
    },
  );

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(color: Colors.black),
      defaultColumnWidth: const FixedColumnWidth(80),
      children: timeSlots
          .map(
            (row) => TableRow(
              children: row
                  .map((slot) => TableCell(
                        child: Container(
                          color: row == timeSlots[0]
                              ? Colors.grey[300]
                              : Colors.white,
                          padding: const EdgeInsets.all(4),
                          child: Text(
                            slot.time.isNotEmpty
                                ? slot.time
                                : slot.value.toString(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(fontSize: 14),
                          ),
                        ),
                      ))
                  .toList(),
            ),
          )
          .toList(),
    );
  }
}

class TimeSlotData {
  final String time; // For time slots
  final int value; // For random values

  TimeSlotData(this.time, this.value);
}

// Generates a row with time slots for a specific hour
List<TimeSlotData> _createTimeRow(int hour) {
  final List<String> minutes = [
    '05',
    '10',
    '15',
    '20',
    '25',
    '30',
    '35',
    '40',
    '45',
    '50',
    '55',
    '00'
  ];
  final String hourStr = hour.toString().padLeft(2, '0');
  return List.generate(
    12,
    (index) {
      String nextHour =
          (hour + (index == 11 ? 1 : 0)).toString().padLeft(2, '0');
      String time = index == 11
          ? '$nextHour:${minutes[index]} AM'
          : '$hourStr:${minutes[index]} AM';
      return TimeSlotData(time, 0); // Value is 0 for time rows
    },
  );
}

// Generates a row of random numbers from 1 to 12
List<TimeSlotData> _createRandomRow() {
  final Random random = Random();
  return List.generate(
    12,
    (_) => TimeSlotData('', random.nextInt(12) + 1),
  );
}
