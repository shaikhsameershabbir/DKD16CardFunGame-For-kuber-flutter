import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kuber/screens/game_options.dart';
import 'package:kuber/widgets/custom_button.dart';
import 'package:sizer/sizer.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final TextEditingController drawController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/bg/game_option_bg.jpg"),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Image.asset(
                  "assets/logo/kuber_logo.png",
                  width: 160,
                  height: 160,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 260,
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Container(
                          height: 40,
                          child: TextFormField(
                            style: const TextStyle(
                                fontSize: 14.0), // Smaller font size
                            decoration: InputDecoration(
                              hintText: 'Username',
                              filled: true,
                              fillColor: const Color(0xFFF5FCF9),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 12.0, // Reduced horizontal padding
                                vertical:
                                    4.0, // Further reduced vertical padding
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.amber, // Golden border color
                                  width: 2, // Border thickness
                                ),
                                borderRadius: BorderRadius.circular(
                                    4.0), // Rounded corners
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors
                                      .amber, // Golden border color when focused
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                            ),
                            onSaved: (phone) {
                              // Save it
                            },
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 40,
                          child: TextFormField(
                            style: const TextStyle(
                                fontSize: 14.0), // Smaller font size
                            decoration: InputDecoration(
                              hintText: 'Password',
                              filled: true,
                              fillColor: const Color(0xFFF5FCF9),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 12.0, // Reduced horizontal padding
                                vertical:
                                    4.0, // Further reduced vertical padding
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.amber, // Golden border color
                                  width: 2, // Border thickness
                                ),
                                borderRadius: BorderRadius.circular(
                                    4.0), // Rounded corners
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors
                                      .amber, // Golden border color when focused
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                            ),
                            onSaved: (phone) {
                              // Save it
                            },
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: screenWidth * 0.1,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();

                                // Navigate to the main screen
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => GameOptions()));
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: const Color(0xFFfed700),
                              foregroundColor: Colors.black,
                              minimumSize: const Size(double.infinity, 48),
                            ),
                            child: Text(
                              "Login",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.1,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

////////////////// Another Game Login Screen //////////////////////////

// class LogInScreen extends StatelessWidget {
//   final _formKey = GlobalKey<FormState>();

//   LogInScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//     return Scaffold(
//         backgroundColor: Colors.white,
//         body: Stack(
//           children: [
//             Container(
//               width: width,
//               height: height,
//               decoration: BoxDecoration(
//                   image: DecorationImage(
//                       fit: BoxFit.cover,
//                       image: AssetImage("assets/bg/loginBg.jpg"))),
//             ),
//             Positioned(
//                 left: 20,
//                 bottom: 50,
//                 child: Container(
//                   decoration: BoxDecoration(
//                       // color: Colors.white.withValues(alpha: 0.8),
//                       borderRadius: BorderRadius.circular(10)),
//                   child: Column(
//                     children: [
//                       SizedBox(
//                         height: 20,
//                       ),
//                       SizedBox(height: 15),
//                       Align(
//                         alignment: Alignment.center,
//                         child: Container(
//                           // color: Colors.red,
//                           width: width * 0.25,
//                           child: Form(
//                             key: _formKey,
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.end,
//                               children: [
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.end,
//                                   children: [
//                                     Spacer(),
//                                     Container(
//                                       width: 80,
//                                       child: Text(
//                                         "LogIn",
//                                         style: Theme.of(context)
//                                             .textTheme
//                                             .headlineSmall!
//                                             .copyWith(
//                                                 fontWeight: FontWeight.bold,
//                                                 fontSize: 12.sp,
//                                                 color: Colors.white),
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       width: width * 0.15,
//                                       height: 35,
//                                       child: TextFormField(
//                                         cursorHeight: 15,
//                                         decoration: const InputDecoration(
//                                           hintText: '',
//                                           hintStyle: TextStyle(fontSize: 14),
//                                           filled: true,
//                                           fillColor: Color(0xFFF5FCF9),
//                                           // contentPadding:
//                                           //     const EdgeInsets.symmetric(
//                                           //         horizontal: 10, vertical: 6.0),
//                                           border: OutlineInputBorder(
//                                             borderSide: BorderSide.none,
//                                             borderRadius: BorderRadius.all(
//                                                 Radius.circular(10)),
//                                           ),
//                                         ),
//                                         keyboardType: TextInputType.phone,
//                                         onSaved: (phone) {
//                                           // Save it
//                                         },
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   height: 10,
//                                 ),
//                                 Row(
//                                   children: [
//                                     Spacer(),
//                                     Container(
//                                       width: 80,
//                                       child: Text(
//                                         "Password",
//                                         style: Theme.of(context)
//                                             .textTheme
//                                             .headlineSmall!
//                                             .copyWith(
//                                                 fontWeight: FontWeight.bold,
//                                                 fontSize: 12.sp,
//                                                 color: Colors.white),
//                                       ),
//                                     ),
//                                     SizedBox(
//                                       width: width * 0.15,
//                                       height: 35,
//                                       child: TextFormField(
//                                         obscureText: true,
//                                         decoration: const InputDecoration(
//                                           hintText: '',
//                                           hintStyle: TextStyle(fontSize: 14),
//                                           filled: true,
//                                           fillColor: Color(0xFFF5FCF9),
//                                           // contentPadding:
//                                           //     const EdgeInsets.symmetric(
//                                           //         horizontal: 10, vertical: 6.0),
//                                           border: OutlineInputBorder(
//                                             borderSide: BorderSide.none,
//                                             borderRadius: BorderRadius.all(
//                                                 Radius.circular(10)),
//                                           ),
//                                         ),
//                                         onSaved: (passaword) {
//                                           // Save it
//                                         },
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   height: 20,
//                                 ),
//                                 SizedBox(
//                                   width: width * 0.5,
//                                   child: Row(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     children: [
//                                       Spacer(),
//                                       CustomButton(
//                                           textColor: Colors.black,
//                                           backgroundColor: Colors.white,
//                                           buttonText: "Log In",
//                                           onPressed: () {
//                                             if (_formKey.currentState!
//                                                 .validate()) {
//                                               _formKey.currentState!.save();
//                                               // Navigate to the main screen
//                                               Navigator.push(
//                                                   context,
//                                                   MaterialPageRoute(
//                                                       builder: (context) =>
//                                                           GameOptions()));
//                                             }
//                                           },
//                                           btnwidth: 80,
//                                           btnheight: 30,
//                                           borderRadius: 1),
//                                       SizedBox(
//                                         width: 5,
//                                       ),
//                                       CustomButton(
//                                           textColor: Colors.black,
//                                           backgroundColor: Colors.white,
//                                           buttonText: "Close",
//                                           onPressed: () {
//                                             SystemNavigator.pop();
//                                           },
//                                           btnwidth: 80,
//                                           btnheight: 30,
//                                           borderRadius: 1),
//                                       SizedBox(
//                                         width: 10,
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 20,
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ))
//           ],
//         ));
//   }
// }
