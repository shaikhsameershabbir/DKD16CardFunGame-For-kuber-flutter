import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

void advanceDrawDialog(BuildContext context, double width, double height) {
  final Set<String> selectedSlots = {};
  final TextEditingController drawController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  bool selectAllDraw = false;

  List<String> generateTimeSlots() {
    List<String> slots = [];
    DateTime currentTime = DateTime(2024, 1, 1, 10, 0); // Start at 10:00 AM

    for (int i = 0; i <= 240; i++) {
      slots.add(DateFormat('hh:mm a').format(currentTime));
      currentTime = currentTime.add(const Duration(minutes: 3));
    }
    return slots;
  }

  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: "Transparent Dialog",
    barrierColor: Colors.transparent, // Transparent background
    pageBuilder: (context, _, __) {
      return Center(
        child: Material(
          type:
              MaterialType.transparency, // Makes the dialog itself transparent
          child: Container(
            width: width * 0.9,
            height: height * 0.7,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.black
                  .withOpacity(0.8), // Adjust dialog background opacity
              borderRadius: BorderRadius.circular(12),
            ),
            child: StatefulBuilder(
              builder: (context, setState) {
                final dialogHeight = height * 0.7;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Time slots grid
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          Container(
                            // padding: const EdgeInsets.all(20),
                            height: dialogHeight * 0.5,
                            width: width,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: RawScrollbar(
                              thumbColor: Colors.grey[400],
                              radius: Radius.zero,
                              thickness: 16,
                              thumbVisibility: true,
                              trackVisibility: true,
                              trackColor: Colors.grey[200],
                              controller: scrollController,
                              child: SingleChildScrollView(
                                controller: scrollController,
                                child: Wrap(
                                  spacing: 8,
                                  runSpacing: 8,
                                  children: generateTimeSlots().map((slot) {
                                    return SizedBox(
                                      width: width * 0.07,
                                      child: Material(
                                        color: const Color(0xFF8e8a8a),
                                        borderRadius: BorderRadius.circular(8),
                                        child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                if (selectedSlots
                                                    .contains(slot)) {
                                                  selectedSlots.remove(slot);
                                                } else {
                                                  selectedSlots.add(slot);
                                                }
                                              });
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets
                                                  .symmetric(
                                                  horizontal: 0,
                                                  vertical:
                                                      2), // Set horizontal padding to 0
                                              child: Row(
                                                mainAxisSize: MainAxisSize
                                                    .min, // Ensures the Row only takes up needed space
                                                children: [
                                                  Transform.scale(
                                                    scale: 0.7,
                                                    child: Checkbox(
                                                      value: selectedSlots
                                                          .contains(slot),
                                                      onChanged: (bool? value) {
                                                        setState(() {
                                                          if (value == true) {
                                                            selectedSlots
                                                                .add(slot);
                                                          } else {
                                                            selectedSlots
                                                                .remove(slot);
                                                          }
                                                        });
                                                      },
                                                      materialTapTargetSize:
                                                          MaterialTapTargetSize
                                                              .shrinkWrap,
                                                      visualDensity:
                                                          VisualDensity.compact,
                                                    ),
                                                  ),
                                                  Text(
                                                    slot,
                                                    style: const TextStyle(
                                                      color: Colors.black87,
                                                      fontSize: 12,
                                                    ),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ],
                                              ),
                                            )),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                textAlign: TextAlign.start,
                                'Advance Draw',
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                decoration: BoxDecoration(
                                  color: Color(
                                      0xFF17b6b1), // Light background color
                                  borderRadius: BorderRadius.circular(
                                      8), // Rounded corners
                                  border: Border.all(
                                      color: Colors
                                          .teal.shade300), // Border styling
                                ),
                                child: SizedBox(
                                  width: 90, // Fixed width for the TextField
                                  child: TextField(
                                    enabled: false,
                                    controller: drawController,
                                    decoration: const InputDecoration(
                                        border: InputBorder
                                            .none, // No underline/border for the field
                                        hintText:
                                            'Enter draw:', // Placeholder text
                                        hintStyle:
                                            TextStyle(color: Colors.white)),
                                  ),
                                ),
                              ),
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                decoration: BoxDecoration(
                                  color: Colors
                                      .teal.shade50, // Light background color
                                  borderRadius: BorderRadius.circular(
                                      8), // Rounded corners
                                  border: Border.all(
                                      color: Colors
                                          .teal.shade300), // Border styling
                                ),
                                child: SizedBox(
                                  width: 90, // Fixed width for the TextField
                                  child: TextField(
                                    controller: drawController,
                                    decoration: const InputDecoration(
                                      border: InputBorder
                                          .none, // No underline/border for the field
                                      hintText: '', // Placeholder text
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Row(
                                children: [
                                  Checkbox(
                                    fillColor: MaterialStateProperty.all<Color>(
                                        Colors.white),
                                    checkColor: Colors.black,
                                    activeColor: Colors.white,
                                    value: selectAllDraw,
                                    onChanged: (value) {
                                      setState(() {
                                        selectAllDraw = value ?? false;
                                      });
                                    },
                                  ),
                                  const Text(
                                    'Select All Draw',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  const SizedBox(width: 16),
                                  ElevatedButton(
                                    onPressed: () {
                                      // Handle submit
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.purple,
                                    ),
                                    child: const Text(
                                      'Submit',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        selectedSlots.clear();
                                        drawController.clear();
                                        selectAllDraw = false;
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.purple,
                                      foregroundColor: Colors.white,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 24,
                                        vertical: 12,
                                      ),
                                    ),
                                    child: const Text('Clear'),
                                  ),
                                  const SizedBox(width: 8),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.purple,
                                      foregroundColor: Colors.white,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 24,
                                        vertical: 12,
                                      ),
                                    ),
                                    child: const Text('Exit'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      );
    },
  );
}
