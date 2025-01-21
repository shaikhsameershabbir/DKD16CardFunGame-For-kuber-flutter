import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kuber/widgets/custom_button.dart';
import 'package:sizer/sizer.dart';

class DusKaDamScreen extends StatefulWidget {
  const DusKaDamScreen({super.key});

  @override
  State<DusKaDamScreen> createState() => _DusKaDamScreenState();
}

class _DusKaDamScreenState extends State<DusKaDamScreen> {
  String fromDate = ''; // Store the 'From' date
  String toDate = ''; // Store the 'To' date

  // Function to open the date picker and set the selected date
  Future<void> _selectDate(BuildContext context, bool isFromDate) async {
    DateTime initialDate = DateTime.now();
    DateTime firstDate = DateTime(1900); // The first selectable date
    DateTime lastDate = DateTime(2100); // The last selectable date

    // Show the date picker dialog
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (pickedDate != null && pickedDate != initialDate) {
      // Format the selected date
      String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);

      // Update the appropriate date based on the `isFromDate` flag
      setState(() {
        if (isFromDate) {
          fromDate = formattedDate;
        } else {
          toDate = formattedDate;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SizedBox(
      width: screenWidth,
      height: screenHeight,
      // margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Stack(
        children: [
          Container(
            width: screenWidth,
            height: screenHeight,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/duskadam/01.jpg"),
                    fit: BoxFit.fill)),
          ),
          Positioned(
              left: 0,
              top: screenHeight * 0.009,
              child: SizedBox(
                width: screenWidth,
                child: Row(
                  children: [
                    SizedBox(
                      width: screenWidth * 0.02,
                    ),
                    Text(
                      "Balance : 2156",
                      style: TextStyle(color: Colors.black, fontSize: 15.sp),
                    ),
                    SizedBox(
                      width: screenWidth * 0.42,
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              _showAccountPopup(
                                  context, screenWidth, screenHeight);
                            },
                            child: Image.asset(
                              "assets/duskadam/page.png",
                              width: screenWidth * 0.03,
                            ),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Image.asset(
                            "assets/duskadam/question.png",
                            width: screenWidth * 0.03,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Image.asset(
                              "assets/duskadam/cross.png",
                              width: screenWidth * 0.03,
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "assets/duskadam/lock.png",
                          width: screenWidth * 0.03,
                        ),
                        SizedBox(
                          width: screenWidth * 0.01,
                        ),
                        Image.asset(
                          "assets/duskadam/advance.png",
                          width: screenWidth * 0.03,
                        ),
                        SizedBox(
                          width: screenWidth * 0.01,
                        ),
                        Image.asset(
                          "assets/duskadam/pati.png",
                          width: screenWidth * 0.03,
                        ),
                        SizedBox(
                          width: screenWidth * 0.01,
                        ),
                        Image.asset(
                          "assets/duskadam/cancel.png",
                          width: screenWidth * 0.03,
                        ),
                        SizedBox(
                          width: screenWidth * 0.01,
                        ),
                        Image.asset(
                          "assets/duskadam/print.png",
                          width: screenWidth * 0.03,
                        ),
                        SizedBox(
                          width: screenWidth * 0.005,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: screenWidth * 0.02,
                    ),
                  ],
                ),
              )),
          Positioned(
              top: screenHeight * 0.1,
              left: screenWidth * 0.28,
              child: SizedBox(
                width: screenWidth * 0.18,
                height: screenHeight * 0.06,
                // color: Colors.green,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "Draw",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 19.sp),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text("12:21PM",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14.sp)),
                  ],
                ),
              )),
          Positioned(
            top: screenHeight * 0.2,
            left: 10,
            child: SizedBox(
              width: screenWidth * 0.44,
              // height: screenHeight * 0.4,
              // color: Colors.red,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      circularImage('assets/duskadam/24.png', screenWidth,
                          screenHeight, true),
                      circularImage('assets/duskadam/25.png', screenWidth,
                          screenHeight, true),
                      circularImage('assets/duskadam/26.png', screenWidth,
                          screenHeight, true),
                      circularImage('assets/duskadam/27.png', screenWidth,
                          screenHeight, true),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      circularImage('assets/duskadam/28.png', screenWidth,
                          screenHeight, true),
                      circularImage('assets/duskadam/29.png', screenWidth,
                          screenHeight, true),
                      circularImage('assets/duskadam/30.png', screenWidth,
                          screenHeight, true),
                      circularImage('assets/duskadam/31.png', screenWidth,
                          screenHeight, true),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      circularImage('assets/duskadam/32.png', screenWidth,
                          screenHeight, true),
                      circularImage('assets/duskadam/33.png', screenWidth,
                          screenHeight, true),
                      circularImage('assets/duskadam/34.png', screenWidth,
                          screenHeight, true),
                      circularImage('assets/duskadam/35.png', screenWidth,
                          screenHeight, true),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              right: 5, top: 60, child: SizedBox(child: ColoredResultTable())),
          Positioned(
            bottom: screenHeight * 0.05,
            left: 10,
            child: SizedBox(
              width: screenWidth * 0.5,
              // height: screenHeight * 0.4,
              // color: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  circularImage('assets/duskadam/10rs.png', screenWidth,
                      screenHeight, false),
                  circularImage('assets/duskadam/20rs.png', screenWidth,
                      screenHeight, false),
                  circularImage('assets/duskadam/50rs.png', screenWidth,
                      screenHeight, false),
                  circularImage('assets/duskadam/100rs.png', screenWidth,
                      screenHeight, false),
                  circularImage('assets/duskadam/500rs.png', screenWidth,
                      screenHeight, false),
                  circularImage('assets/duskadam/1krs.png', screenWidth,
                      screenHeight, false),
                ],
              ),
            ),
          ),
          Positioned(
              bottom: screenHeight * 0.06,
              right: screenWidth * 0.348,
              child: Container(
                height: screenWidth * 0.09,
                width: screenWidth * 0.14,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/duskadam/total.png"),
                        fit: BoxFit.contain)),
              )),
          Positioned(
            bottom: screenHeight * 0.21,
            right: screenWidth * 0.48,
            child: SizedBox(
              // color: Colors.red,
              height: screenWidth * 0.029,
              width: screenWidth * 0.19,
              child: Row(
                children: [
                  // Image widget
                  Image.asset(
                    'assets/duskadam/br1.png',
                    width: screenWidth * 0.045,
                    height: screenHeight * 0.08,
                  ),
                  SizedBox(width: 10),

                  Expanded(
                    child: SizedBox(
                      height: screenHeight * 0.035,
                      child: TextFormField(
                        cursorHeight: 12,
                        decoration: const InputDecoration(
                          hintText: '',
                          hintStyle: TextStyle(fontSize: 12),
                          filled: true,
                          fillColor: Color(0xFFF5FCF9),
                          contentPadding: EdgeInsets.all(10),
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.all(Radius.circular(1)),
                          ),
                        ),
                        onSaved: (phone) {
                          // Save it
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              bottom: screenHeight * 0.25,
              right: screenWidth * 0.29,
              child: SizedBox(
                height: screenWidth * 0.06,
                width: screenWidth * 0.18,
                // color: Colors.red,
                child: Row(
                  children: [
                    CustomButton(
                      borderRadius: 16,
                      btnwidth: screenWidth * 0.07,
                      btnheight: screenHeight * 0.05,
                      buttonText: "PRINT",
                      onPressed: () {},
                      fontSize: 13,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    CustomButton(
                      borderRadius: 16,
                      btnwidth: screenWidth * 0.07,
                      btnheight: screenHeight * 0.05,
                      buttonText: "RESET",
                      onPressed: () {},
                      backgroundColor: Color(0xFFa93226),
                      fontSize: 13,
                    ),
                  ],
                ),
              )),
        ],
      ),
    ));
  }

  /////////////// Show Account For Account ////////////////
  void _showAccountPopup(
      BuildContext context, double screenWidth, double screenHeight) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: LinearBorder(),
          insetPadding: EdgeInsets.zero,
          child: Container(
            // color: Colors.red,
            width: screenWidth * 0.9,
            height: screenHeight * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.05,
                  color: Color(0xFF5499c7),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 60,
                        height: 60,
                      ),
                      Spacer(),
                      Text(
                        "Account",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                      Spacer(),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image.asset(
                          "assets/duskadam/closewindow.png",
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.04,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    countersale_netto_pay(
                        "Counter Sale", 12.sp, Color(0xFF5499c7), 2),
                    SizedBox(
                      width: 5,
                    ),
                    countersale_netto_pay("Net Tot Pay", 12.sp,
                        Color.fromARGB(255, 235, 239, 241), 2)
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.04,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      "From",
                      style: TextStyle(
                          fontSize: 12.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () => _selectDate(
                          context, true), // On Tap, select the 'From' date
                      child: Container(
                        padding: EdgeInsets.only(
                            top: 5, right: 65, bottom: 5, left: 5),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 0.2),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          fromDate.isEmpty ? 'dd-mm-yyyy' : fromDate,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "To",
                      style: TextStyle(
                          fontSize: 12.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () => _selectDate(
                          context, false), // On Tap, select the 'To' date
                      child: Container(
                        padding: EdgeInsets.only(
                            top: 5, right: 65, bottom: 5, left: 5),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 0.2),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          toDate.isEmpty ? 'dd-mm-yyyy' : toDate,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    countersale_netto_pay("Submit", 12.sp, Colors.yellow, 2),
                    SizedBox(
                      width: 5,
                    ),
                    countersale_netto_pay("Cancel", 12.sp, Colors.red, 2),
                    SizedBox(
                      width: 5,
                    ),
                    countersale_netto_pay("Print", 12.sp, Color(0xFF21618c), 2)
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.04,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 5,
                    ),
                    AccountTable(),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(left: 10),
                        // width: screenWidth * 0.3,
                        height: screenHeight * 0.6,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(1),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text("Game Id : 10kaDum"),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Counter Sale"),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Retailer Code : retailer"),
                            SizedBox(
                              height: 10,
                            ),
                            Text("2025-01-21      To     2025-01-21"),
                            SizedBox(
                              height: 10,
                            ),
                            Divider(
                              height: 2,
                              color: Colors.black,
                              thickness: 5,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Play            120",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Win            - 0",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            // Text("Comission            120",style: TextStyle(color: Colors.black),),
                            Divider(
                              height: 2,
                              color: Colors.black,
                              thickness: 5,
                            ),
                            SizedBox(
                              height: 10,
                            ),

                            Text(
                              "Outstanding     120",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Server Time : 2025-01-21 03:38:05 PM"),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  countersale_netto_pay(
      String title, double fontsize, Color bgColor, double borderRadius) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        ),
      ),
      child: Text(
        title,
        style: TextStyle(fontSize: fontsize, color: Colors.black),
      ),
    );
  }

  Widget circularImage(String image, double width, double height, bool isText) {
    return Stack(
      children: [
        Image.asset(
          width: width * 0.07,
          image,
          fit: BoxFit.cover,
        ),
        isText == false
            ? Container()
            : Positioned(
                top: 65,
                left: 28,
                child: Text(
                  "Play",
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                      fontSize: 16,
                      decoration: TextDecoration.none),
                ))
      ],
    );
  }
}

class ColoredResultTable extends StatelessWidget {
  final List<String> results =
      List.generate(17, (index) => 'Result ${index + 1}');
  final List<Color> colors = [
    Colors.amber,
    Colors.green,
    Colors.purple,
    Colors.green,
    Colors.green,
    Colors.purple,
    Colors.purple,
    Colors.pink,
    Colors.amber,
    Colors.purple,
    Colors.amber,
    Colors.purple,
    Colors.green,
    Colors.pink,
    Colors.blue,
    Colors.orange,
    Colors.teal,
  ];

  ColoredResultTable({super.key});

  @override
  Widget build(BuildContext context) {
    // Retrieve screen width and height using MediaQuery
    double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;

    return SizedBox(
      width: screenWidth * 0.28,
      // height: screenHeight * 0.15,
      child: Table(
        border: TableBorder.all(color: Colors.white), // Border around each cell
        columnWidths: {
          0: FlexColumnWidth(2),
          1: FlexColumnWidth(2),
        },
        children: [
          // Header row
          TableRow(
            decoration:
                BoxDecoration(color: const Color.fromARGB(255, 99, 35, 12)),
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Time',
                    style: TextStyle(
                        fontFamily: 'Times New Roman',
                        fontWeight: FontWeight.bold,
                        fontSize: 14.sp,
                        decoration: TextDecoration.none,
                        color: Colors.black),
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
                        fontSize: 14.sp,
                        decoration: TextDecoration.none,
                        color: Colors.black),
                  ),
                ),
              ),
            ],
          ),

          // Data rows
          for (int i = 0; i < results.length; i++)
            TableRow(
              decoration: BoxDecoration(
                color: colors[i],
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      'Time ${i + 1}',
                      style: TextStyle(
                          fontFamily: 'Times New Roman',
                          fontWeight: FontWeight.normal,
                          fontSize: 12.sp,
                          decoration: TextDecoration.none,
                          color: Colors.black),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      results[i],
                      style: TextStyle(
                          fontFamily: 'Times New Roman',
                          fontWeight: FontWeight.normal,
                          fontSize: 12.sp,
                          decoration: TextDecoration.none,
                          color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class AccountTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: screenWidth * 0.5,
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
