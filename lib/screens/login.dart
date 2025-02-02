import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuber/cubit/auth_cubit.dart';
import 'package:kuber/cubit/balance_update_cubit.dart/balance_update_cubit.dart';
import 'package:kuber/cubit/claimticket/claim_ticket_cubit.dart';
import 'package:kuber/cubit/dkdWinner/dkd_winner_cubit.dart';
import 'package:kuber/cubit/drawtimecubit/draw_time_cubit.dart';
import 'package:kuber/screens/game_options.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String systemUniqueId = '';

  @override
  void initState() {
    super.initState();
    getWindowsUniqueId();
  }

  Future<void> getWindowsUniqueId() async {
    final deviceInfo = DeviceInfoPlugin();
    final windowsInfo = await deviceInfo.windowsInfo;
    setState(() {
      systemUniqueId = windowsInfo.deviceId;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg/game_option_bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthLoginSuccess) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GameOptions()),
              );
            }
          },
          builder: (context, state) {
            final authCubit = context.read<AuthCubit>();
            // final timerCubit = context
            //     .read<TimerCubit>().initializeTimerSocket(); // Access TimerCubit but don't use it

            final balanceCubit = context.read<BalanceUpdateCubit>();
            final drawTimeCubit = context.read<DrawTimeCubit>();
            final dkdWinner = context.read<DkdWinnerCubit>();
            // final getDateResult = context
            //     .read<GetAndViewResultCubit>()
            //     .initializeGetResultsSocket();

            return Center(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/logo/kuber_logo.png",
                        width: 160, height: 160),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 260,
                      child: TextFormField(
                        controller: _usernameController,
                        decoration: _inputDecoration('Username'),
                        validator: (value) =>
                            value!.isEmpty ? 'Enter username' : null,
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 260,
                      child: TextFormField(
                        controller: _passwordController,
                        decoration: _inputDecoration('Password'),
                        obscureText: true,
                        validator: (value) =>
                            value!.isEmpty ? 'Enter password' : null,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFFfed700),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          authCubit.login("retailer", "1234", systemUniqueId);
                        }
                      },
                      child: state is AuthLoading
                          ? const CircularProgressIndicator()
                          : const Text('Login'),
                    ),
                    if (state is AuthSocketError)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          state.errorMessage,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                    if (state is AuthLoginFailure)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          state.errorMessage,
                          style: const TextStyle(color: Colors.red),
                        ),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Container(
  //       decoration: BoxDecoration(
  //         image: DecorationImage(
  //           image:
  //               AssetImage("assets/bg/game_option_bg.jpg"), // Background image
  //           fit: BoxFit.cover,
  //         ),
  //       ),
  //       child: BlocConsumer<AuthCubit, AuthState>(
  //         listener: (context, state) {
  //           if (state is AuthLoginSuccess) {
  //             Navigator.push(context,
  //                 MaterialPageRoute(builder: (context) => GameOptions()));
  //           }
  //         },
  //         builder: (context, state) {
  //           final cubit = context.read<AuthCubit>();

  //           return Center(
  //             child: Form(
  //               key: _formKey,
  //               child: Column(
  //                 mainAxisAlignment: MainAxisAlignment.center,
  //                 children: [
  //                   Image.asset("assets/logo/kuber_logo.png",
  //                       width: 160, height: 160),
  //                   const SizedBox(height: 10),
  //                   SizedBox(
  //                     width: 260,
  //                     child: TextFormField(
  //                       controller: _usernameController,
  //                       decoration: _inputDecoration('Username'),
  //                       validator: (value) =>
  //                           value!.isEmpty ? 'Enter username' : null,
  //                     ),
  //                   ),
  //                   const SizedBox(height: 10),
  //                   SizedBox(
  //                     width: 260,
  //                     child: TextFormField(
  //                       controller: _passwordController,
  //                       decoration: _inputDecoration('Password'),
  //                       obscureText: true,
  //                       validator: (value) =>
  //                           value!.isEmpty ? 'Enter password' : null,
  //                     ),
  //                   ),
  //                   const SizedBox(height: 20),
  //                   ElevatedButton(
  //                     style: ElevatedButton.styleFrom(
  //                       backgroundColor: Color(0xFFfed700),
  //                     ),
  //                     onPressed: () {
  //                       if (_formKey.currentState!.validate()) {
  //                         // cubit.login(
  //                         //   _usernameController.text,
  //                         //   _passwordController.text,
  //                         //   systemUniqueId,
  //                         // );

  //                         cubit.login("retailer", "1234", systemUniqueId);
  //                       }
  //                     },
  //                     child: state is AuthLoading
  //                         ? const CircularProgressIndicator()
  //                         : const Text('Login'),
  //                   ),
  //                   if (state is AuthSocketError)
  //                     Padding(
  //                       padding: const EdgeInsets.all(8.0),
  //                       child: Text(
  //                         state.errorMessage,
  //                         style: const TextStyle(color: Colors.red),
  //                       ),
  //                     ),
  //                   if (state is AuthLoginFailure)
  //                     Padding(
  //                       padding: const EdgeInsets.all(8.0),
  //                       child: Text(
  //                         state.errorMessage,
  //                         style: const TextStyle(color: Colors.red),
  //                       ),
  //                     ),
  //                 ],
  //               ),
  //             ),
  //           );
  //         },
  //       ),
  //     ),
  //   );
  // }

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: const Color(0xFFF5FCF9),
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.amber, width: 2),
        borderRadius: BorderRadius.circular(4.0),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.amber, width: 2),
        borderRadius: BorderRadius.circular(4.0),
      ),
    );
  }
}
