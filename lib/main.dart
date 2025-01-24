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

class ImageAnimationPage extends StatefulWidget {
  @override
  _ImageAnimationPageState createState() => _ImageAnimationPageState();
}

class _ImageAnimationPageState extends State<ImageAnimationPage>
    with SingleTickerProviderStateMixin {
  // List of asset images
  final List<String> _images = [
    'assets/duskadam/colored/Asset 1.png',
    'assets/duskadam/colored/Asset 2.png',
    'assets/duskadam/colored/Asset 3.png',
    'assets/duskadam/colored/Asset 4.png',
    'assets/duskadam/colored/Asset 5.png',
  ];

  late AnimationController _controller;
  late int _currentImageIndex;

  @override
  void initState() {
    super.initState();
    _currentImageIndex = 0;

    // AnimationController for changing images
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..addListener(_updateImage);

    // Start the animation (change the image every 1 second)
    _controller.repeat();
  }

  // Update the image index based on animation value
  void _updateImage() {
    setState(() {
      _currentImageIndex = (_currentImageIndex + 1) % _images.length;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Image Animation')),
      body: Center(
        child: Flexible(
          child: Image.asset(
            _images[_currentImageIndex], // Display image based on current index
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
