import 'package:flutter/material.dart';
import 'package:kuber/screens/game_options.dart';

class LogInScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  LogInScreen({super.key});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/bg/loginBg.jpg"))),
            ),
            Positioned(
                left: 20,
                bottom: 50,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.8),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Sign In",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Colors.black87),
                      ),
                      SizedBox(height: 15),
                      Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: width * 0.25,
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                SizedBox(
                                  width: width * 0.15,
                                  height: 35,
                                  child: TextFormField(
                                    cursorHeight: 15,
                                    decoration: const InputDecoration(
                                      hintText: 'Username',
                                      hintStyle: TextStyle(fontSize: 14),
                                      filled: true,
                                      fillColor: Color(0xFFF5FCF9),
                                      // contentPadding:
                                      //     const EdgeInsets.symmetric(
                                      //         horizontal: 10, vertical: 6.0),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                    ),
                                    keyboardType: TextInputType.phone,
                                    onSaved: (phone) {
                                      // Save it
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  width: width * 0.15,
                                  height: 35,
                                  child: TextFormField(
                                    obscureText: true,
                                    decoration: const InputDecoration(
                                      hintText: 'Password',
                                      hintStyle: TextStyle(fontSize: 14),
                                      filled: true,
                                      fillColor: Color(0xFFF5FCF9),
                                      // contentPadding:
                                      //     const EdgeInsets.symmetric(
                                      //         horizontal: 10, vertical: 6.0),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                    ),
                                    onSaved: (passaword) {
                                      // Save it
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  width: width * 0.15,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        _formKey.currentState!.save();
                                        // Navigate to the main screen
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    GameOptions()));
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      backgroundColor: const Color(0xFF2e3138),
                                      foregroundColor: Colors.white,
                                      minimumSize:
                                          const Size(double.infinity, 48),
                                      shape: const StadiumBorder(),
                                    ),
                                    child: const Text("Sign in"),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        ));
  }
}
