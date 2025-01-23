import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kuber/screens/onclickmenupopup/account_screen.dart';
import 'package:kuber/screens/onclickmenupopup/barcodeclick_winning_popup.dart';
import 'package:kuber/screens/onclickmenupopup/change_password_popup.dart';
import 'package:kuber/widgets/custom_button.dart';
import 'package:sizer/sizer.dart';

class DusKaDamScreen extends StatefulWidget {
  const DusKaDamScreen({super.key});

  @override
  State<DusKaDamScreen> createState() => _DusKaDamScreenState();
}

class _DusKaDamScreenState extends State<DusKaDamScreen> {
  final TextEditingController _barcodeController = TextEditingController();

  int downRowSelectedIndex = 0;
  int upRowSelectedIndex = 0;
  List<int> coinTotals = List<int>.filled(12, 0);
  int placeTotalCoin1 = 0;
  int placeTotalCoin2 = 0;
  int placeTotalCoin3 = 0;
  int placeTotalCoin4 = 0;
  int placeTotalCoin5 = 0;
  int placeTotalCoin6 = 0;
  int placeTotalCoin7 = 0;
  int placeTotalCoin8 = 0;
  int placeTotalCoin9 = 0;
  int placeTotalCoin10 = 0;
  int placeTotalCoin11 = 0;
  int placeTotalCoin12 = 0;

  int finalResult = 0;
  countFinalResult() {
    setState(() {
      finalResult = placeTotalCoin1 +
          placeTotalCoin2 +
          placeTotalCoin3 +
          placeTotalCoin4 +
          placeTotalCoin5 +
          placeTotalCoin6 +
          placeTotalCoin7 +
          placeTotalCoin8 +
          placeTotalCoin9 +
          placeTotalCoin10 +
          placeTotalCoin11 +
          placeTotalCoin12;
      if (finalResult < 0) {
        setState(() {
          finalResult = 0;
        });
      }
    });
  }

  bool is_counter_sale = true;
  bool is_net_to_pay = false;
  // bool btnSelected = true;
  Color btnSelectedColor = Color(0xFF5499c7);
  Color btnUnselectedColor = Color.fromARGB(255, 235, 239, 241);

  String fromDate = '';
  String toDate = '';

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

      setState(() {
        if (isFromDate) {
          fromDate = formattedDate;
        } else {
          toDate = formattedDate;
        }
      });
    }
  }

  //////////////////////////////////// Timer //////////////////////////////
  late Timer _timer;
  int _seconds = 150; // 2 minutes and 30 seconds

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_seconds > 0) {
          _seconds--;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return "${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}";
  }

  //////////////////////////////////////////////////////////////////////////

  void placeBet(int downIndexValue, String whichClick) {
    if (downIndexValue == 10 && whichClick == 'left') {
      placeTotalCoin10 = placeTotalCoin10 + downIndexValue;
    } else if (downIndexValue == 20) {
      placeTotalCoin10 = placeTotalCoin10 + downIndexValue;
    } else if (downIndexValue == 50) {
      placeTotalCoin10 = placeTotalCoin10 + downIndexValue;
    } else if (downIndexValue == 100) {
      placeTotalCoin10 = placeTotalCoin10 + downIndexValue;
    } else if (downIndexValue == 500) {
      placeTotalCoin10 = placeTotalCoin10 + downIndexValue;
    } else if (downIndexValue == 1000) {
      placeTotalCoin10 = placeTotalCoin10 + downIndexValue;
    }

    if (downIndexValue == 10 && whichClick == 'left') {
      placeTotalCoin10 = placeTotalCoin10 + downIndexValue;
    } else if (downIndexValue == 20) {
      placeTotalCoin10 = placeTotalCoin10 + downIndexValue;
    } else if (downIndexValue == 50) {
      placeTotalCoin10 = placeTotalCoin10 + downIndexValue;
    } else if (downIndexValue == 100) {
      placeTotalCoin10 = placeTotalCoin10 + downIndexValue;
    } else if (downIndexValue == 500) {
      placeTotalCoin10 = placeTotalCoin10 + downIndexValue;
    } else if (downIndexValue == 1000) {
      placeTotalCoin10 = placeTotalCoin10 + downIndexValue;
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
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: screenWidth * 0.34,
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
                              width: screenWidth * 0.04,
                            ),
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          Image.asset(
                            "assets/duskadam/question.png",
                            width: screenWidth * 0.04,
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
                              width: screenWidth * 0.04,
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            print("Dialog Triggered");
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Container(
                                  width: 80,
                                  height: 90,
                                  color: Colors.red,
                                );
                              },
                            );
                          },
                          child: Image.asset(
                            "assets/duskadam/lock.png",
                            width: screenWidth * 0.04,
                          ),
                        ),
                        SizedBox(
                          width: screenWidth * 0.01,
                        ),
                        Image.asset(
                          "assets/duskadam/advance.png",
                          width: screenWidth * 0.04,
                        ),
                        SizedBox(
                          width: screenWidth * 0.01,
                        ),
                        Image.asset(
                          "assets/duskadam/pati.png",
                          width: screenWidth * 0.04,
                        ),
                        SizedBox(
                          width: screenWidth * 0.01,
                        ),
                        Image.asset(
                          "assets/duskadam/cancel.png",
                          width: screenWidth * 0.04,
                        ),
                        SizedBox(
                          width: screenWidth * 0.01,
                        ),
                        Image.asset(
                          "assets/duskadam/print.png",
                          width: screenWidth * 0.04,
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
              top: screenHeight * 0.08,
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

          ////////// Timer /////////////////////
          Positioned(
            top: screenHeight * 0.12,
            right: screenWidth * 0.29,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Image.asset(
                  width: screenWidth * 0.26,
                  height: screenHeight * 0.24,
                  'assets/duskadam/timer.png', // Add your image to the assets folder
                  fit: BoxFit.contain,
                ),
                Text(
                  _formatTime(_seconds),
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        offset: Offset(2, 2),
                        blurRadius: 4,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          ///////////////////////////////////// 3N //////////////////
          Positioned(
            top: screenHeight * 0.48,
            right: screenWidth * 0.365,
            child: Container(
              width: screenWidth * 0.11,
              height: screenHeight * 0.13,
              // color: Colors.red,
              child: Row(
                children: [
                  Flexible(
                    child: Image.asset(
                      'assets/duskadam/3.png', // Add your image to the assets folder
                      fit: BoxFit.contain,
                    ),
                  ),
                  Flexible(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          'assets/duskadam/whiteCard.png', // Add your image to the assets folder
                          fit: BoxFit.contain,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Image.asset(
                            'assets/duskadam/NK.png', // Add your image to the assets folder
                            fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            top: screenHeight * 0.18,
            left: 10,
            child: Container(
              width: screenWidth * 0.36,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      circularImage(
                        event: (PointerDownEvent event) {
                          if (event.buttons == kPrimaryMouseButton) {
                            setState(() {
                              placeTotalCoin1 += downRowSelectedIndex;
                              countFinalResult();
                            });
                          } else if (event.buttons == kSecondaryMouseButton) {
                            setState(() {
                              placeTotalCoin1 -= downRowSelectedIndex;
                              countFinalResult();
                            });
                          }
                        },
                        coinTotal: placeTotalCoin1,
                        image: 'assets/duskadam/24.png',
                        width: screenWidth * 0.07,
                      ),
                      // circularImage(
                      //   event: (event) {
                      //     if (event.buttons == kPrimaryMouseButton) {
                      //       setState(() {
                      //         placeTotalCoin1 =
                      //             placeTotalCoin1 + downRowSelectedIndex;
                      //         print("printing $downRowSelectedIndex");
                      //       });
                      //     } else if (event.buttons == kSecondaryMouseButton) {
                      //       setState(() {
                      //         placeTotalCoin1 =
                      //             placeTotalCoin1 - downRowSelectedIndex;
                      //       });
                      //     }
                      //   },
                      //   coinTotal: placeTotalCoin1,
                      //   image: 'assets/duskadam/24.png',
                      //   width: screenWidth * 0.07,
                      // ),
                      circularImage(
                        event: (event) {
                          if (event.buttons == kPrimaryMouseButton) {
                            setState(() {
                              placeTotalCoin2 =
                                  placeTotalCoin2 + downRowSelectedIndex;
                              countFinalResult();
                            });
                          } else if (event.buttons == kSecondaryMouseButton) {
                            setState(() {
                              placeTotalCoin2 =
                                  placeTotalCoin2 - downRowSelectedIndex;
                              countFinalResult();
                            });
                          }
                        },
                        coinTotal: placeTotalCoin2,
                        image: 'assets/duskadam/25.png',
                        width: screenWidth * 0.07,
                      ),
                      circularImage(
                        event: (event) {
                          if (event.buttons == kPrimaryMouseButton) {
                            setState(() {
                              placeTotalCoin3 =
                                  placeTotalCoin3 + downRowSelectedIndex;
                              countFinalResult();
                            });
                          } else if (event.buttons == kSecondaryMouseButton) {
                            setState(() {
                              placeTotalCoin3 =
                                  placeTotalCoin3 - downRowSelectedIndex;
                              countFinalResult();
                            });
                          }
                        },
                        coinTotal: placeTotalCoin3,
                        image: 'assets/duskadam/26.png',
                        width: screenWidth * 0.07,
                      ),
                      circularImage(
                        event: (event) {
                          if (event.buttons == kPrimaryMouseButton) {
                            setState(() {
                              placeTotalCoin4 =
                                  placeTotalCoin4 + downRowSelectedIndex;
                              countFinalResult();
                            });
                          } else if (event.buttons == kSecondaryMouseButton) {
                            setState(() {
                              placeTotalCoin4 =
                                  placeTotalCoin4 - downRowSelectedIndex;
                              countFinalResult();
                            });
                          }
                        },
                        coinTotal: placeTotalCoin4,
                        image: 'assets/duskadam/27.png',
                        width: screenWidth * 0.07,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      circularImage(
                        event: (event) {
                          if (event.buttons == kPrimaryMouseButton) {
                            setState(() {
                              placeTotalCoin5 =
                                  placeTotalCoin5 + downRowSelectedIndex;
                              countFinalResult();
                            });
                          } else if (event.buttons == kSecondaryMouseButton) {
                            setState(() {
                              placeTotalCoin5 =
                                  placeTotalCoin5 - downRowSelectedIndex;
                              countFinalResult();
                            });
                          }
                        },
                        coinTotal: placeTotalCoin5,
                        image: 'assets/duskadam/28.png',
                        width: screenWidth * 0.07,
                      ),
                      circularImage(
                        event: (event) {
                          if (event.buttons == kPrimaryMouseButton) {
                            setState(() {
                              placeTotalCoin6 =
                                  placeTotalCoin6 + downRowSelectedIndex;
                              countFinalResult();
                            });
                          } else if (event.buttons == kSecondaryMouseButton) {
                            setState(() {
                              placeTotalCoin6 =
                                  placeTotalCoin6 - downRowSelectedIndex;
                              countFinalResult();
                            });
                          }
                        },
                        coinTotal: placeTotalCoin6,
                        image: 'assets/duskadam/29.png',
                        width: screenWidth * 0.07,
                      ),
                      circularImage(
                        event: (event) {
                          if (event.buttons == kPrimaryMouseButton) {
                            setState(() {
                              placeTotalCoin7 =
                                  placeTotalCoin7 + downRowSelectedIndex;
                              countFinalResult();
                            });
                          } else if (event.buttons == kSecondaryMouseButton) {
                            setState(() {
                              placeTotalCoin7 =
                                  placeTotalCoin7 - downRowSelectedIndex;
                              countFinalResult();
                            });
                          }
                        },
                        coinTotal: placeTotalCoin7,
                        image: 'assets/duskadam/30.png',
                        width: screenWidth * 0.07,
                      ),
                      circularImage(
                        event: (event) {
                          if (event.buttons == kPrimaryMouseButton) {
                            setState(() {
                              placeTotalCoin8 =
                                  placeTotalCoin8 + downRowSelectedIndex;
                              countFinalResult();
                            });
                          } else if (event.buttons == kSecondaryMouseButton) {
                            setState(() {
                              placeTotalCoin8 =
                                  placeTotalCoin8 - downRowSelectedIndex;
                              countFinalResult();
                            });
                          }
                        },
                        coinTotal: placeTotalCoin8,
                        image: 'assets/duskadam/31.png',
                        width: screenWidth * 0.07,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenHeight * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      circularImage(
                        event: (event) {
                          if (event.buttons == kPrimaryMouseButton) {
                            setState(() {
                              placeTotalCoin9 =
                                  placeTotalCoin9 + downRowSelectedIndex;
                              countFinalResult();
                            });
                          } else if (event.buttons == kSecondaryMouseButton) {
                            setState(() {
                              placeTotalCoin9 =
                                  placeTotalCoin9 - downRowSelectedIndex;
                              countFinalResult();
                            });
                          }
                        },
                        coinTotal: placeTotalCoin9,
                        image: 'assets/duskadam/32.png',
                        width: screenWidth * 0.07,
                      ),
                      circularImage(
                        event: (event) {
                          if (event.buttons == kPrimaryMouseButton) {
                            setState(() {
                              placeTotalCoin10 =
                                  placeTotalCoin10 + downRowSelectedIndex;
                              countFinalResult();
                            });
                          } else if (event.buttons == kSecondaryMouseButton) {
                            setState(() {
                              placeTotalCoin10 =
                                  placeTotalCoin10 - downRowSelectedIndex;
                              countFinalResult();
                            });
                          }
                        },
                        coinTotal: placeTotalCoin10,
                        image: 'assets/duskadam/33.png',
                        width: screenWidth * 0.07,
                      ),
                      circularImage(
                        event: (event) {
                          if (event.buttons == kPrimaryMouseButton) {
                            setState(() {
                              placeTotalCoin11 =
                                  placeTotalCoin11 + downRowSelectedIndex;
                              countFinalResult();
                            });
                          } else if (event.buttons == kSecondaryMouseButton) {
                            setState(() {
                              placeTotalCoin11 =
                                  placeTotalCoin11 - downRowSelectedIndex;
                              countFinalResult();
                            });
                          }
                        },
                        coinTotal: placeTotalCoin11,
                        image: 'assets/duskadam/34.png',
                        width: screenWidth * 0.07,
                      ),
                      circularImage(
                        event: (event) {
                          if (event.buttons == kPrimaryMouseButton) {
                            setState(() {
                              placeTotalCoin12 =
                                  placeTotalCoin12 + downRowSelectedIndex;
                              countFinalResult();
                            });
                          } else if (event.buttons == kSecondaryMouseButton) {
                            setState(() {
                              placeTotalCoin12 =
                                  placeTotalCoin12 - downRowSelectedIndex;
                              countFinalResult();
                            });
                          }
                        },
                        coinTotal: placeTotalCoin12,
                        image: 'assets/duskadam/35.png',
                        width: screenWidth * 0.07,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              right: 5,
              top: screenHeight * 0.11,
              child: SizedBox(child: AccountScreenTable())),
          Positioned(
            bottom: screenHeight * 0.03,
            left: 10,
            child: Container(
              width: screenWidth * 0.4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  circularImage(
                    event: (event) {
                      if (event.buttons == kPrimaryMouseButton) {
                        setState(() {
                          downRowSelectedIndex = 10;
                          print("$downRowSelectedIndex is the one");
                        });
                      } else if (event.buttons == kSecondaryMouseButton) {
                        // Right-click event
                        print('Right Click Detected 10');
                      }
                    },
                    downRowindex: 10,
                    greenCoin: 'assets/duskadam/coin10.png',
                    image: 'assets/duskadam/10rs.png',
                    width: screenWidth * 0.05,
                  ),
                  circularImage(
                    event: (event) {
                      if (event.buttons == kPrimaryMouseButton) {
                        setState(() {
                          downRowSelectedIndex = 20;
                        });
                      } else if (event.buttons == kSecondaryMouseButton) {
                        // Right-click event
                        print('Right Click Detected 20');
                      }
                    },
                    downRowindex: 20,
                    greenCoin: 'assets/duskadam/coin20.png',
                    image: 'assets/duskadam/20rs.png',
                    width: screenWidth * 0.05,
                  ),
                  circularImage(
                    event: (event) {
                      if (event.buttons == kPrimaryMouseButton) {
                        setState(() {
                          downRowSelectedIndex = 50;
                        });
                      } else if (event.buttons == kSecondaryMouseButton) {
                        // Right-click event
                        print('Right Click Detected 50');
                      }
                    },
                    downRowindex: 50,
                    greenCoin: 'assets/duskadam/coin50.png',
                    image: 'assets/duskadam/50rs.png',
                    width: screenWidth * 0.05,
                  ),
                  circularImage(
                    event: (event) {
                      if (event.buttons == kPrimaryMouseButton) {
                        setState(() {
                          downRowSelectedIndex = 100;
                        });
                      } else if (event.buttons == kSecondaryMouseButton) {}
                    },
                    downRowindex: 100,
                    greenCoin: 'assets/duskadam/coin100.png',
                    image: 'assets/duskadam/100rs.png',
                    width: screenWidth * 0.05,
                  ),
                  circularImage(
                    event: (event) {
                      if (event.buttons == kPrimaryMouseButton) {
                        setState(() {
                          downRowSelectedIndex = 500;
                        });
                      } else if (event.buttons == kSecondaryMouseButton) {}
                    },
                    downRowindex: 500,
                    greenCoin: 'assets/duskadam/coin500.png',
                    image: 'assets/duskadam/500rs.png',
                    width: screenWidth * 0.05,
                  ),
                  circularImage(
                    event: (event) {
                      if (event.buttons == kPrimaryMouseButton) {
                        setState(() {
                          downRowSelectedIndex = 1000;
                        });
                      } else if (event.buttons == kSecondaryMouseButton) {}
                    },
                    downRowindex: 1000,
                    greenCoin: 'assets/duskadam/coin1000.png',
                    image: 'assets/duskadam/1krs.png',
                    width: screenWidth * 0.05,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              bottom: screenHeight * 0.01,
              right: screenWidth * 0.348,
              child: Container(
                height: screenWidth * 0.09,
                width: screenWidth * 0.14,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset("assets/duskadam/total.png",
                        fit: BoxFit.contain),
                    finalResult > 0
                        ? Text(
                            textAlign: TextAlign.center,
                            "$finalResult",
                            style: TextStyle(
                                fontSize: 16.sp, fontWeight: FontWeight.bold),
                          )
                        : Container()
                  ],
                ),
              )),
          Positioned(
            bottom: screenHeight * 0.15,
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
                        onFieldSubmitted: (value) {
                          showPopup(context, _barcodeController.text,
                              screenWidth, screenHeight);
                        },
                        cursorHeight: 12,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                        decoration: const InputDecoration(
                          hintText: '',
                          hintStyle: TextStyle(fontSize: 12),
                          filled: true,
                          fillColor: Color(0xFFF5FCF9),
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 0, horizontal: 10),
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
              right: screenWidth * 0.31,
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
        return StatefulBuilder(builder: (context, setDialogState) {
          return Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            insetPadding: EdgeInsets.zero,
            child: Container(
              width: screenWidth * 0.9,
              height: screenHeight * 0.9,
              child: Column(
                children: [
                  // Header row with title and close button
                  Container(
                    width: screenWidth * 0.9,
                    height: screenHeight * 0.05,
                    color: Color(0xFF5499c7),
                    child: Row(
                      children: [
                        SizedBox(width: 60, height: 60),
                        Spacer(),
                        Text(
                          "Account",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context); // Close the dialog
                          },
                          child: Image.asset("assets/duskadam/closewindow.png"),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  Row(
                    children: [
                      SizedBox(width: 15),
                      countersale_netto_pay(
                        onClick: () {
                          setDialogState(() {
                            is_counter_sale = true;
                            is_net_to_pay = false;
                          });
                        },
                        title: "Counter Sale",
                        fontsize: 12.sp,
                        bgColor: is_counter_sale
                            ? btnSelectedColor
                            : btnUnselectedColor,
                        borderRadius: 2,
                      ),
                      SizedBox(width: 5),
                      countersale_netto_pay(
                        onClick: () {
                          setDialogState(() {
                            is_counter_sale = false;
                            is_net_to_pay = true;
                          });
                        },
                        title: "Net Tot Pay",
                        fontsize: 12.sp,
                        bgColor: is_net_to_pay
                            ? btnSelectedColor
                            : btnUnselectedColor,
                        borderRadius: 2,
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  Row(
                    children: [
                      SizedBox(width: 15),
                      Text("From",
                          style: TextStyle(
                              fontSize: 12.sp, fontWeight: FontWeight.bold)),
                      SizedBox(width: 5),
                      GestureDetector(
                        onTap: () => _selectDate(context, true),
                        child: Container(
                          padding: EdgeInsets.only(
                              top: 5, right: 65, bottom: 5, left: 5),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black, width: 0.2),
                              borderRadius: BorderRadius.circular(4)),
                          child: Text(
                              fromDate.isEmpty ? 'dd-mm-yyyy' : fromDate,
                              style: TextStyle(fontSize: 16)),
                        ),
                      ),
                      SizedBox(width: 5),
                      Text("To",
                          style: TextStyle(
                              fontSize: 12.sp, fontWeight: FontWeight.bold)),
                      SizedBox(width: 5),
                      GestureDetector(
                        onTap: () => _selectDate(context, false),
                        child: Container(
                          padding: EdgeInsets.only(
                              top: 5, right: 65, bottom: 5, left: 5),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: Colors.black, width: 0.2),
                              borderRadius: BorderRadius.circular(4)),
                          child: Text(toDate.isEmpty ? 'dd-mm-yyyy' : toDate,
                              style: TextStyle(fontSize: 16)),
                        ),
                      ),
                      SizedBox(width: 5),
                      countersale_netto_pay(
                        onClick: () {},
                        title: "Submit",
                        fontsize: 12.sp,
                        bgColor: Colors.yellow,
                        borderRadius: 2,
                      ),
                      SizedBox(width: 5),
                      countersale_netto_pay(
                        onClick: () {},
                        title: "Cancel",
                        fontsize: 12.sp,
                        bgColor: Colors.red,
                        borderRadius: 2,
                      ),
                      SizedBox(width: 5),
                      countersale_netto_pay(
                        onClick: () {},
                        title: "Print",
                        fontsize: 12.sp,
                        bgColor: Color(0xFF21618c),
                        borderRadius: 2,
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  Row(
                    children: [
                      SizedBox(width: 5),
                      AccountTable(),
                      SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: 10),
                          height: screenHeight * 0.6,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(1)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              Text("Game Id : 10kaDum"),
                              SizedBox(height: 10),
                              Text("Counter Sale"),
                              SizedBox(height: 10),
                              Text("Retailer Code : retailer"),
                              SizedBox(height: 10),
                              Text("2025-01-21 To 2025-01-21"),
                              SizedBox(height: 10),
                              Divider(
                                  height: 2, color: Colors.black, thickness: 5),
                              SizedBox(height: 10),
                              Text("Play 120",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(height: 10),
                              Text("Win - 0",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              is_net_to_pay
                                  ? SizedBox(height: 10)
                                  : Container(),
                              is_net_to_pay
                                  ? Text("Commission - 12",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold))
                                  : Container(),
                              SizedBox(height: 10),
                              Divider(
                                  height: 2, color: Colors.black, thickness: 5),
                              SizedBox(height: 10),
                              Text("Outstanding 120",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(height: 10),
                              Text("Server Time : 2025-01-21 03:38:05 PM"),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 5),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
      },
    );
  }

  // ignore: non_constant_identifier_names
  countersale_netto_pay(
      {VoidCallback? onClick,
      required String title,
      double? fontsize,
      Color? bgColor,
      double? borderRadius}) {
    return ElevatedButton(
      onPressed: onClick,
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius!)),
        ),
      ),
      child: Text(
        title,
        style: TextStyle(fontSize: fontsize, color: Colors.black),
      ),
    );
  }

  Widget circularImage({
    required PointerDownEventListener event,
    required String image,
    double? width,
    double? height,
    int? downRowindex,
    int? upRowSelectedIndex,
    int? coinTotal = 0,
    String? greenCoin,
    int placedText = 0,
  }) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Listener(
          onPointerDown: event,
          child: Image.asset(
            downRowSelectedIndex == downRowindex ? greenCoin ?? image : image,
            width: width,
            height: height,
            fit: BoxFit.cover,
          ),
        ),
        coinTotal == 0
            ? Container()
            : Text(
                "$coinTotal",
                style: TextStyle(fontSize: 15.sp),
              ),
      ],
    );
  }

  // Widget circularImage({
  //   VoidCallback? onTap,
  //   required String image,
  //   double? width,
  //   double? height,
  //   int? downRowindex,
  //   int? upRowSelectedIndex,
  //   int? coinTotal = 0,
  //   String? greenCoin,
  //   int placedText = 0,
  //   PointerDownEventListener? event,
  //   int? coin1to12 = 0,
  // }) {
  //   return Stack(
  //     alignment: Alignment.center,
  //     children: [
  //       Listener(
  //         onPointerDown: event,
  //         child: GestureDetector(
  //           onTap: onTap,
  //           child: Image.asset(
  //             downRowSelectedIndex == downRowindex ? greenCoin ?? image : image,
  //             width: width,
  //             height: height,
  //             fit: BoxFit.cover,
  //           ),
  //         ),
  //       ),
  //       coin1to12 == 0
  //           ? Container()
  //           : Text(
  //               "$coinTotal",
  //               style: TextStyle(fontSize: 15.sp),
  //             ),
  //     ],
  //   );
  // }
}

class AccountTable extends StatelessWidget {
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
