import 'package:flutter/material.dart';
import 'package:kuber/widgets/custom_button.dart';

class DusKaDamScreen extends StatefulWidget {
  const DusKaDamScreen({super.key});

  @override
  State<DusKaDamScreen> createState() => _DusKaDamScreenState();
}

class _DusKaDamScreenState extends State<DusKaDamScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Container(
      width: screenWidth,
      height: screenHeight,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
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
              child: Container(
                width: screenWidth,
                child: Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Balance : 2156",
                      style: TextStyle(color: Colors.black),
                    ),
                    SizedBox(
                      width: screenWidth * 0.47,
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Image.asset(
                            "assets/duskadam/page.png",
                            width: screenWidth * 0.022,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Image.asset(
                            "assets/duskadam/question.png",
                            width: screenWidth * 0.022,
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Image.asset(
                            "assets/duskadam/cross.png",
                            width: screenWidth * 0.022,
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "assets/duskadam/lock.png",
                          width: screenWidth * 0.022,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Image.asset(
                          "assets/duskadam/advance.png",
                          width: screenWidth * 0.022,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Image.asset(
                          "assets/duskadam/pati.png",
                          width: screenWidth * 0.022,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Image.asset(
                          "assets/duskadam/cancel.png",
                          width: screenWidth * 0.022,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Image.asset(
                          "assets/duskadam/print.png",
                          width: screenWidth * 0.022,
                        )
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
              left: screenWidth * 0.33,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Draw",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text("12:21PM",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              )),
          Positioned(
            top: screenHeight * 0.2,
            left: 10,
            child: Container(
              width: screenWidth * 0.35,
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
                    height: 5,
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
                    height: 5,
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
              right: 10,
              top: 60,
              child: Container(
                  height: screenHeight * 0.75, child: ColoredResultTable())),
          Positioned(
            bottom: screenHeight * 0.06,
            left: 10,
            child: Container(
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
              right: screenWidth * 0.32,
              child: Container(
                height: screenWidth * 0.06,
                width: screenWidth * 0.15,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/duskadam/total.png"),
                        fit: BoxFit.cover)),
              )),
          Positioned(
            bottom: screenHeight * 0.22,
            right: screenWidth * 0.53,
            child: Container(
              // color: Colors.red,
              height: screenWidth * 0.022,
              width: screenWidth * 0.15,
              child: Row(
                children: [
                  // Image widget
                  Image.asset(
                    'assets/duskadam/br1.png',
                    width: screenWidth * 0.045,
                    height: 30,
                  ),
                  SizedBox(width: 10),

                  Expanded(
                    child: Container(
                      height: screenHeight * 0.025,
                      child: TextFormField(
                        cursorHeight: 12,
                        decoration: const InputDecoration(
                          hintText: '',
                          hintStyle: TextStyle(fontSize: 12),
                          filled: true,
                          fillColor: Color(0xFFF5FCF9),
                          contentPadding: EdgeInsets.all(10),
                          border: const OutlineInputBorder(
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
              bottom: screenHeight * 0.28,
              right: screenWidth * 0.32,
              child: Container(
                height: screenWidth * 0.06,
                width: screenWidth * 0.18,
                child: Row(
                  children: [
                    CustomButton(buttonText: "PRINT", onPressed: () {}),
                    SizedBox(
                      width: 5,
                    ),
                    CustomButton(
                      buttonText: "RESET",
                      onPressed: () {},
                      backgroundColor: Color(0xFF4A3298),
                    ),
                  ],
                ),
              )),
        ],
      ),
    ));
  }

  Widget circularImage(String image, double width, double height, bool isText) {
    return Stack(
      children: [
        Image.asset(
          width: width * 0.06,
          image,
          fit: BoxFit.cover,
        ),
        isText == false
            ? Container()
            : Positioned(
                top: 40,
                left: 18,
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

  @override
  Widget build(BuildContext context) {
    // Retrieve screen width and height using MediaQuery
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth * 0.27,
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
                child: Text(
                  'Time',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      decoration: TextDecoration.none,
                      color: Colors.black),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Result',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      decoration: TextDecoration.none,
                      color: Colors.black),
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
                  child: Text(
                    'Time ${i + 1}',
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 11,
                        decoration: TextDecoration.none,
                        color: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    results[i], // Display Result from the list
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 11,
                        decoration: TextDecoration.none,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
