import 'package:flutter/material.dart';
import 'package:kuber/screens/login.dart';
import 'package:sizer/sizer.dart';
import 'package:window_manager/window_manager.dart';
// import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  // Maximize the window by default
  windowManager.setFullScreen(true);

  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: LogInScreen(),
//     );
//   }
// }

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

// import 'package:flutter/material.dart';
// import 'package:flutter/gestures.dart';
// import 'package:window_manager/window_manager.dart';
// import 'package:sizer/sizer.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await windowManager.ensureInitialized();

//   // Maximize the window by default
//   windowManager.setFullScreen(true);

//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Sizer(
//       builder: (context, orientation, deviceType) {
//         return MaterialApp(
//           debugShowCheckedModeBanner: false,
//           home: const LogInScreen(),
//         );
//       },
//     );
//   }
// }

// class LogInScreen extends StatefulWidget {
//   const LogInScreen({super.key});

//   @override
//   State<LogInScreen> createState() => _LogInScreenState();
// }

// class _LogInScreenState extends State<LogInScreen> {
//   void _handleLeftClick() {
//     print('Left click detected');
//     // Add your left click logic here
//   }

//   void _handleRightClick(BuildContext context, Offset position) {
//     print('Right click detected');
//     // Show context menu
//     final RenderBox overlay =
//         Overlay.of(context).context.findRenderObject() as RenderBox;
//     showMenu(
//       context: context,
//       position: RelativeRect.fromRect(
//         position & const Size(48.0, 48.0),
//         Offset.zero & overlay.size,
//       ),
//       items: <PopupMenuEntry>[
//         PopupMenuItem(
//           value: 1,
//           child: const Text('Option 1'),
//           onTap: () {
//             // Add your menu item 1 logic here
//             print('Option 1 selected');
//           },
//         ),
//         PopupMenuItem(
//           value: 2,
//           child: const Text('Option 2'),
//           onTap: () {
//             // Add your menu item 2 logic here
//             print('Option 2 selected');
//           },
//         ),
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Listener(
//         onPointerDown: (PointerDownEvent event) {
//           if (event.kind == PointerDeviceKind.mouse) {
//             if (event.buttons == kPrimaryButton) {
//               _handleLeftClick();
//             } else if (event.buttons == kSecondaryButton) {
//               _handleRightClick(context, event.position);
//             }
//           }
//         },
//         child: Container(
//           // Your existing login screen content goes here
//           color: Colors.white,
//           child: const Center(
//             child: Text('Login Screen Content'),
//           ),
//         ),
//       ),
//     );
//   }
// }
