import 'dart:io';

import 'package:device_preview_plus/device_preview_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:kuber/cubit/auth_cubit.dart';
import 'package:kuber/cubit/balance_update_cubit.dart/balance_update_cubit.dart';
import 'package:kuber/cubit/claimticket/claim_ticket_cubit.dart';
import 'package:kuber/cubit/counter_sale_nettotpay_cubit/countersale_nettotpay_cubit.dart';
import 'package:kuber/cubit/cubit/timer_cubit.dart';
import 'package:kuber/cubit/dkdWinner/dkd_winner_cubit.dart';
import 'package:kuber/cubit/drawtimecubit/draw_time_cubit.dart';
import 'package:kuber/cubit/getandviewresultcubit/get_and_view_result_cubit.dart';
import 'package:kuber/screens/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import 'package:window_manager/window_manager.dart';
// import 'package:window_manager/window_manager.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

late IO.Socket socket;

void main() async {
  HttpOverrides.global = MyHttpOverrides(); // Disable SSL verification
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  // Maximize the window by default
  windowManager.setFullScreen(true);

  String? _token;

  final prefs = await SharedPreferences.getInstance();
  _token = prefs.getString('token');

  socket = IO.io(
    "https://147.93.103.122:4000",
    // "http://192.168.0.224:4000",
    IO.OptionBuilder()
        .setTransports(['websocket'])
        .enableAutoConnect()
        .setExtraHeaders({'Cookie': 'token=$_token'}) // Send token as cookie
        .setAuth({'token': _token}) // Also send in auth for redundancy
        .build(),
  );

  // Connect the socket first before passing it to the cubits
  socket.onConnect((_) {
    print("Socket Connected to server.");

    runApp(DevicePreview(
      enabled: false,
      builder: (context) => MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => BalanceUpdateCubit(socket: socket)
                ..initializeBalanceSocket()),
          BlocProvider(
              create: (context) =>
                  DrawTimeCubit(socket: socket)..initializeDrawTimeSocket()),
          BlocProvider(
              create: (context) =>
                  DkdWinnerCubit(socket: socket)..initializeDKDWinnerSocket()),
// ------------------------------------------------------------------------------------------------------
          BlocProvider(
              create: (context) => GetAndViewResultCubit(socket: socket)
                ..initializeGetResultsSocket(
                    DateFormat('yyyy-MM-dd').format(DateTime.now()))),
// ------------------------------------------------------------------------------------------------------
          BlocProvider(create: (context) => ClaimTicketCubit(socket: socket)),
// ------------------------------------------------------------------------------------------------------
          BlocProvider(
              create: (context) => CountersaleNettotpayCubit(socket: socket)),
// ------------------------------------------------------------------------------------------------------
          BlocProvider(
            create: (context) => AuthCubit(
                socket: socket,
                balanceCubit: context.read<BalanceUpdateCubit>())
              ..initializeSocket(),
          ),
          BlocProvider(
            create: (context) =>
                TimerCubit(socket: socket)..initializeTimerSocket(),
          ),
        ],
        child: MyApp(),
      ),
    ));
  });

  // Optional: Handle socket connection error if needed
  socket.onConnectError((error) {
    print("Socket connection error: $error");
  });

  // Optional: Handle socket disconnect
  socket.onDisconnect((_) {
    print("Socket disconnected.");
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final timerCubit = context.read<TimerCubit>();

    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: LogInScreen(),
        );
      },
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await windowManager.ensureInitialized();

//   // Maximize the window by default
//   windowManager.setFullScreen(true);

//   String? _token;

//   final prefs = await SharedPreferences.getInstance();
//   _token = prefs.getString('token');

//   socket = IO.io(
//     "http://147.93.103.122:4000",
//     IO.OptionBuilder()
//         .setTransports(['websocket'])
//         .enableAutoConnect()
//         .setExtraHeaders({'Cookie': 'token=$_token'}) // Send token as cookie
//         .setAuth({'token': _token}) // Also send in auth for redundancy
//         .build(),
//   );

//   runApp(DevicePreview(
//     enabled: false,
//     builder: (context) => MultiBlocProvider(
//       providers: [
//         BlocProvider(
//           create: (_) => AuthCubit(socket: socket)..initializeSocket(),
//         ),
//         BlocProvider(
//             create: (_) =>
//                 TimerCubit(socket: socket)..initializeTimerSocket(socket))
//       ],
//       child: MyApp(),
//     ),
//   ));
// }

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await windowManager.ensureInitialized();

//   // Maximize the window by default
//   windowManager.setFullScreen(true);

//   runApp(DevicePreview(
//     enabled: false,
//     builder: (context) => BlocProvider(
//       create: (_) =>
//           AuthCubit()..initializeSocket("http://147.93.103.122:4000"),
//       // AuthCubit()..initializeSocket("http://192.168.0.225:4000"), // local
//       child: MyApp(),
//     ),
//   ));
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Sizer(
//       builder: (context, orientation, deviceType) {
//         return MaterialApp(
//           debugShowCheckedModeBanner: false,
//           home: LogInScreen(),
//         );
//       },
//     );
//   }
// }
