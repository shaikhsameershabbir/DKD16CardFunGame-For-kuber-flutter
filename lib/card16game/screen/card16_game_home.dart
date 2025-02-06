import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Card16GameHome extends StatefulWidget {
  const Card16GameHome({super.key});

  @override
  State<Card16GameHome> createState() => _HomePageState();
}

class _HomePageState extends State<Card16GameHome> {
  double width = 0;
  double height = 0;

  int currentValueOfChip = 0;
  int chipsSelectedIndex = -1; // No chip selected initially

  void selectChip(int index) {
    setState(() {
      chipsSelectedIndex = index; // Set selected chip index
      currentValueOfChip = chipsSelectedIndex;

      print("selected index $chipsSelectedIndex");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        // Get the screen width and height
        double screenWidth = constraints.maxWidth;
        double screenHeight = constraints.maxHeight;

        return Container(
          width: screenWidth,
          height: screenHeight,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/cardgame/gamebg/game bg.png"),
                  fit: BoxFit.cover)),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              ///////////////////// first Column //////////////////////////////////////
              Flexible(
                flex: 2,
                child: Container(
                  // margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.all(15),
                  height: screenHeight,
                  width: screenWidth * 0.4,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Container(
                                width: screenWidth *
                                    0.12, // Image width is based on screen width
                                // height: screenWidth * 0.009,
                                child: Image.asset(
                                  "assets/cardgame/mainpageimages/gameid.png",
                                  fit: BoxFit
                                      .cover, // Ensure the image doesn't overflow
                                ),
                              ),
                              Text(
                                "GAME ID - WSD3453SD",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 9,
                                  fontWeight: FontWeight
                                      .bold, // You can adjust style as needed
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                // padding: EdgeInsets.all(40),
                                width: screenWidth * 0.34,
                                decoration: BoxDecoration(
                                    // shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/cardgame/mainpageimages/outerwheel.png"))),

                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Positioned(
                                      top: screenHeight * 0.12,
                                      child: Container(
                                        width: screenWidth * 0.57,
                                        height: screenHeight * 0.57,
                                        child: Image.asset(
                                            fit: BoxFit.contain,
                                            "assets/cardgame/mainpageimages/innerwheel.png"),
                                      ),
                                    ),
                                    Positioned(
                                      top: screenHeight * 0.2,
                                      child: Container(
                                        width: screenWidth * 0.4,
                                        height: screenHeight * 0.4,
                                        child: Image.asset(
                                            fit: BoxFit.contain,
                                            "assets/cardgame/mainpageimages/small wheel.png"),
                                      ),
                                    ),
                                    Positioned(
                                      top: screenHeight * 0.31,
                                      child: Container(
                                        width: screenWidth * 0.18,
                                        height: screenHeight * 0.18,
                                        child: Image.asset(
                                            fit: BoxFit.contain,
                                            "assets/cardgame/mainpageimages/wheel centre.png"),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Image.asset(
                                      height: screenHeight * 0.07,
                                      "assets/cardgame/mainpageImages/placeyourchips.png"),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                      // color: Colors.yellow,
                                      child: Stack(
                                    alignment: Alignment.centerLeft,
                                    children: [
                                      Image.asset(
                                          height: screenHeight * 0.07,
                                          "assets/cardgame/mainpageImages/playtextbox.png"),
                                      Text(
                                        "Play - 0",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  )),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Container(
                                      // color: Colors.yellow,
                                      child: Stack(
                                    alignment: Alignment.centerLeft,
                                    children: [
                                      Image.asset(
                                          height: screenHeight * 0.07,
                                          "assets/cardgame/mainpageImages/wintextbox.png"),
                                      Text(
                                        "Win - 0",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  )),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              ///////////////////// Second Column //////////////////////////////////////

              Flexible(
                flex: 2,
                child: Container(
                  // color: Colors.red,
                  // margin: EdgeInsets.only(top: 55),
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  height: screenHeight,
                  width: screenWidth * 0.4,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        height: screenHeight * 0.08,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              // height: screenHeight * 0.1,
                              // color: Colors.amber,
                              width: screenWidth * 0.024,
                              // height: screenWidth * 0.009,
                              child: Image.asset(
                                "assets/cardgame/mainpageimages/info.png",
                                fit: BoxFit
                                    .cover, // Ensure the image doesn't overflow
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width: screenWidth * 0.14,
                                  child: Image.asset(
                                    "assets/cardgame/mainpageimages/balance.png",
                                    fit: BoxFit
                                        .cover, // Ensure the image doesn't overflow
                                  ),
                                ),
                                Text(
                                  "                       WSD3453SD",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 9,
                                    fontWeight: FontWeight
                                        .bold, // You can adjust style as needed
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              // height: screenHeight * 0.4,
                              // width: screenWidth * 0.345,
                              // color: Colors.cyan,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: screenHeight * 0.115,
                                    child: Row(
                                      children: [
                                        cardsWidget(
                                            event: (PointerDownEvent event) {
                                              if (event.buttons ==
                                                  kPrimaryMouseButton) {
                                                print("left press ");
                                              } else if (event.buttons ==
                                                  kSecondaryMouseButton) {
                                                print("Right press ");
                                              }
                                            },
                                            image:
                                                "assets/cardgame/mainpageimages/cards/heart play.png"),
                                        cardsWidget(
                                            event: (PointerDownEvent event) {
                                              if (event.buttons ==
                                                  kPrimaryMouseButton) {
                                              } else if (event.buttons ==
                                                  kSecondaryMouseButton) {}
                                            },
                                            image:
                                                "assets/cardgame/mainpageimages/cards/ace play.png"),
                                        cardsWidget(
                                            event: (PointerDownEvent event) {
                                              if (event.buttons ==
                                                  kPrimaryMouseButton) {
                                                print("left press ");
                                              } else if (event.buttons ==
                                                  kSecondaryMouseButton) {
                                                print("Right press ");
                                              }
                                            },
                                            image:
                                                "assets/cardgame/mainpageimages/cards/diamond play.png"),
                                        cardsWidget(
                                            event: (PointerDownEvent event) {
                                              if (event.buttons ==
                                                  kPrimaryMouseButton) {
                                              } else if (event.buttons ==
                                                  kSecondaryMouseButton) {}
                                            },
                                            image:
                                                "assets/cardgame/mainpageimages/cards/spade play.png")
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.115,
                                    child: Row(
                                      children: [
                                        cardsWidget(
                                            event: (PointerDownEvent event) {
                                              if (event.buttons ==
                                                  kPrimaryMouseButton) {
                                              } else if (event.buttons ==
                                                  kSecondaryMouseButton) {}
                                            },
                                            image:
                                                "assets/cardgame/mainpageimages/cards/1.png"),
                                        cardsWidget(
                                            event: (PointerDownEvent event) {
                                              if (event.buttons ==
                                                  kPrimaryMouseButton) {
                                              } else if (event.buttons ==
                                                  kSecondaryMouseButton) {}
                                            },
                                            image:
                                                "assets/cardgame/mainpageimages/cards/2.png"),
                                        cardsWidget(
                                            event: (PointerDownEvent event) {
                                              if (event.buttons ==
                                                  kPrimaryMouseButton) {
                                              } else if (event.buttons ==
                                                  kSecondaryMouseButton) {}
                                            },
                                            image:
                                                "assets/cardgame/mainpageimages/cards/3.png"),
                                        cardsWidget(
                                            event: (PointerDownEvent event) {
                                              if (event.buttons ==
                                                  kPrimaryMouseButton) {
                                              } else if (event.buttons ==
                                                  kSecondaryMouseButton) {}
                                            },
                                            image:
                                                "assets/cardgame/mainpageimages/cards/4.png")
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.115,
                                    child: Row(
                                      children: [
                                        cardsWidget(
                                            event: (PointerDownEvent event) {
                                              if (event.buttons ==
                                                  kPrimaryMouseButton) {
                                              } else if (event.buttons ==
                                                  kSecondaryMouseButton) {}
                                            },
                                            image:
                                                "assets/cardgame/mainpageimages/cards/5.png"),
                                        cardsWidget(
                                            event: (PointerDownEvent event) {
                                              if (event.buttons ==
                                                  kPrimaryMouseButton) {
                                              } else if (event.buttons ==
                                                  kSecondaryMouseButton) {}
                                            },
                                            image:
                                                "assets/cardgame/mainpageimages/cards/6.png"),
                                        cardsWidget(
                                            event: (PointerDownEvent event) {
                                              if (event.buttons ==
                                                  kPrimaryMouseButton) {
                                              } else if (event.buttons ==
                                                  kSecondaryMouseButton) {}
                                            },
                                            image:
                                                "assets/cardgame/mainpageimages/cards/7.png"),
                                        cardsWidget(
                                            event: (PointerDownEvent event) {
                                              if (event.buttons ==
                                                  kPrimaryMouseButton) {
                                              } else if (event.buttons ==
                                                  kSecondaryMouseButton) {}
                                            },
                                            image:
                                                "assets/cardgame/mainpageimages/cards/8.png")
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.115,
                                    child: Row(
                                      children: [
                                        cardsWidget(
                                            event: (PointerDownEvent event) {
                                              if (event.buttons ==
                                                  kPrimaryMouseButton) {
                                              } else if (event.buttons ==
                                                  kSecondaryMouseButton) {}
                                            },
                                            image:
                                                "assets/cardgame/mainpageimages/cards/9.png"),
                                        cardsWidget(
                                            event: (PointerDownEvent event) {
                                              if (event.buttons ==
                                                  kPrimaryMouseButton) {
                                              } else if (event.buttons ==
                                                  kSecondaryMouseButton) {}
                                            },
                                            image:
                                                "assets/cardgame/mainpageimages/cards/10.png"),
                                        cardsWidget(
                                            event: (PointerDownEvent event) {
                                              if (event.buttons ==
                                                  kPrimaryMouseButton) {
                                              } else if (event.buttons ==
                                                  kSecondaryMouseButton) {}
                                            },
                                            image:
                                                "assets/cardgame/mainpageimages/cards/11.png"),
                                        cardsWidget(
                                            event: (PointerDownEvent event) {
                                              if (event.buttons ==
                                                  kPrimaryMouseButton) {
                                              } else if (event.buttons ==
                                                  kSecondaryMouseButton) {}
                                            },
                                            image:
                                                "assets/cardgame/mainpageimages/cards/12.png")
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.115,
                                    child: Row(
                                      children: [
                                        cardsWidget(
                                            event: (PointerDownEvent event) {
                                              if (event.buttons ==
                                                  kPrimaryMouseButton) {
                                              } else if (event.buttons ==
                                                  kSecondaryMouseButton) {}
                                            },
                                            image:
                                                "assets/cardgame/mainpageimages/cards/13.png"),
                                        cardsWidget(
                                            event: (PointerDownEvent event) {
                                              if (event.buttons ==
                                                  kPrimaryMouseButton) {
                                              } else if (event.buttons ==
                                                  kSecondaryMouseButton) {}
                                            },
                                            image:
                                                "assets/cardgame/mainpageimages/cards/14.png"),
                                        cardsWidget(
                                            event: (PointerDownEvent event) {
                                              if (event.buttons ==
                                                  kPrimaryMouseButton) {
                                              } else if (event.buttons ==
                                                  kSecondaryMouseButton) {}
                                            },
                                            image:
                                                "assets/cardgame/mainpageimages/cards/15.png"),
                                        cardsWidget(
                                            event: (PointerDownEvent event) {
                                              if (event.buttons ==
                                                  kPrimaryMouseButton) {
                                              } else if (event.buttons ==
                                                  kSecondaryMouseButton) {}
                                            },
                                            image:
                                                "assets/cardgame/mainpageimages/cards/16.png")
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        // margin: EdgeInsets.symmetric(
                        //     chorizontal: screenWidth * 0.01),
                        // color: Colors.yellow,
                        width: screenWidth * 0.345,
                        height: screenHeight * 0.31,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                    child: Container(
                                  height: screenHeight * 0.11,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/cardgame/mainpageimages/wincards/wincardsbg.png"))),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Flexible(
                                          child: Image.asset(
                                              width: screenWidth * 0.028,
                                              "assets/cardgame/mainpageimages/wincards/a_ace.png")),
                                      Flexible(
                                          child: Image.asset(
                                              width: screenWidth * 0.028,
                                              "assets/cardgame/mainpageimages/wincards/a_ace.png")),
                                      Flexible(
                                          child: Image.asset(
                                              width: screenWidth * 0.028,
                                              "assets/cardgame/mainpageimages/wincards/a_ace.png")),
                                      Flexible(
                                          child: Image.asset(
                                              width: screenWidth * 0.028,
                                              "assets/cardgame/mainpageimages/wincards/a_ace.png")),
                                      Flexible(
                                          child: Image.asset(
                                              width: screenWidth * 0.028,
                                              "assets/cardgame/mainpageimages/wincards/a_ace.png")),
                                      Flexible(
                                          child: Image.asset(
                                              width: screenWidth * 0.028,
                                              "assets/cardgame/mainpageimages/wincards/a_ace.png")),
                                      Flexible(
                                          child: Image.asset(
                                              width: screenWidth * 0.028,
                                              "assets/cardgame/mainpageimages/wincards/a_ace.png")),
                                      Flexible(
                                          child: Image.asset(
                                              width: screenWidth * 0.028,
                                              "assets/cardgame/mainpageimages/wincards/a_ace.png")),
                                      Flexible(
                                          child: Image.asset(
                                              width: screenWidth * 0.028,
                                              "assets/cardgame/mainpageimages/wincards/a_ace.png")),
                                      Flexible(
                                          child: Image.asset(
                                              width: screenWidth * 0.028,
                                              "assets/cardgame/mainpageimages/wincards/a_ace.png")),
                                    ],
                                  ),
                                )),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                    child: Container(
                                  height: screenHeight * 0.11,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              "assets/cardgame/mainpageimages/chips/chipsbg.png"))),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      GestureDetector(
                                        onTap: () => selectChip(5),
                                        child: Container(
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.asset(
                                            "assets/cardgame/mainpageimages/chips/5.png",
                                            width: chipsSelectedIndex == 5
                                                ? screenWidth * 0.055
                                                : screenWidth * 0.045,
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () => selectChip(10),
                                        child: Container(
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.asset(
                                            "assets/cardgame/mainpageimages/chips/10.png",
                                            width: chipsSelectedIndex == 10
                                                ? screenWidth * 0.055
                                                : screenWidth * 0.045,
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () => selectChip(20),
                                        child: Container(
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.asset(
                                            "assets/cardgame/mainpageimages/chips/20.png",
                                            width: chipsSelectedIndex == 20
                                                ? screenWidth * 0.055
                                                : screenWidth * 0.045,
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () => selectChip(50), //
                                        child: Container(
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.asset(
                                            "assets/cardgame/mainpageimages/chips/50.png",
                                            width: chipsSelectedIndex == 50
                                                ? screenWidth * 0.055
                                                : screenWidth * 0.045,
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () => selectChip(100),
                                        child: Container(
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.asset(
                                            "assets/cardgame/mainpageimages/chips/100.png",
                                            width: chipsSelectedIndex == 100
                                                ? screenWidth * 0.055
                                                : screenWidth * 0.045,
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () => selectChip(500),
                                        child: Container(
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.asset(
                                            "assets/cardgame/mainpageimages/chips/500.png",
                                            width: chipsSelectedIndex == 500
                                                ? screenWidth * 0.055
                                                : screenWidth * 0.045,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                    child: Image.asset(
                                        width: screenWidth * 0.08,
                                        "assets/cardgame/mainpageimages/greenbuttons/BET.png")),
                                Flexible(
                                    child: Image.asset(
                                        width: screenWidth * 0.08,
                                        "assets/cardgame/mainpageimages/greenbuttons/clear.png")),
                                Flexible(
                                    child: Image.asset(
                                        width: screenWidth * 0.08,
                                        "assets/cardgame/mainpageimages/greenbuttons/double.png")),
                                Flexible(
                                    child: Image.asset(
                                        width: screenWidth * 0.08,
                                        "assets/cardgame/mainpageimages/greenbuttons/rebet.png")),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),

              ///////////////////// third Column //////////////////////////////////////

              Flexible(
                flex: 1,
                child: Container(
                  // color: Colors.amber,
                  height: screenHeight,
                  width: screenWidth - (screenWidth * 0.4 * 2),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      GestureDetector(
                        onTap: () {
                          exit(0);
                        },
                        child: Padding(
                          padding: EdgeInsets.all(screenWidth * 0.01),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Image.asset(
                                "assets/cardgame/mainpageimages/cut.png",
                                height: screenHeight * 0.04,
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        // margin: EdgeInsets.only(top: screenHeight * 0.05),
                        height: screenHeight * 0.1,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/cardgame/mainpageimages/bet template.png"))),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisSize: MainAxisSize
                                .min, // Prevents unnecessary stretching
                            children: [
                              SizedBox(
                                height: 80, // Set desired height
                                child: Image.asset(
                                  "assets/cardgame/mainpageimages/all aces.png",
                                  fit: BoxFit.contain,
                                ),
                              ),
                              SizedBox(
                                height: 80,
                                child: Image.asset(
                                  "assets/cardgame/mainpageimages/all jacks.png",
                                  fit: BoxFit.contain,
                                ),
                              ),
                              SizedBox(
                                height: 80,
                                child: Image.asset(
                                  "assets/cardgame/mainpageimages/all kings.png",
                                  fit: BoxFit.contain,
                                ),
                              ),
                              SizedBox(
                                height: 80,
                                child: Image.asset(
                                  "assets/cardgame/mainpageimages/all queens.png",
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                          width: screenWidth * 0.1,
                          // height: screenHeight * 0.05,
                          child: Image.asset(
                            "assets/cardgame/mainpageimages/timer.png",
                          )),
                      Container(
                          width: screenWidth * 0.1,
                          height: screenHeight * 0.05,
                          child: Image.asset(
                              "assets/cardgame/mainpageimages/barcode.png")),
                      SizedBox(
                        height: screenHeight * 0.04,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  cardsWidget({
    required PointerDownEventListener event,
    required String image,
  }) {
    return Expanded(
        child: Listener(
      onPointerDown: event,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(image),
          Text(
            "10",
            style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: Colors.green),
          )
        ],
      ),
    ));
  }
}
