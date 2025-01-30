import 'package:device_preview_plus/device_preview_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuber/cubit/auth_cubit.dart';
import 'package:kuber/screens/login.dart';
import 'package:sizer/sizer.dart';
import 'package:window_manager/window_manager.dart';
// import 'package:window_manager/window_manager.dart';

// late IO.Socket socket;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  // Maximize the window by default
  windowManager.setFullScreen(true);

  runApp(DevicePreview(
    enabled: false,
    builder: (context) => BlocProvider(
      create: (_) =>
          // AuthCubit()..initializeSocket("http://147.93.103.122:4000"),
          AuthCubit()..initializeSocket("http://192.168.0.225:4000"), // local
      child: MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
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

// void main() async {
//   IO.Socket socket;
//   socket = IO.io('http://192.168.0.224:4000', <String, dynamic>{
//     'transports': ['websocket'],
//   });
//   socket.on('connect', (_) {
//     print('Connected to server');
//   });
//   socket.on('disconnect', (_) {
//     print('Not Connected to server');
//   });
//   WidgetsFlutterBinding.ensureInitialized();
//   await windowManager.ensureInitialized();

//   // Maximize the window by default
//   windowManager.setFullScreen(true);

//   runApp(DevicePreview(enabled: false, builder: (context) => MyApp()));
// }
