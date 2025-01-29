///////////////////////// Barcode 1 //////////////////////
library;

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:barcode/barcode.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BarcodeScreen(),
    );
  }
}

class BarcodeScreen extends StatefulWidget {
  const BarcodeScreen({super.key});

  @override
  _BarcodeScreenState createState() => _BarcodeScreenState();
}

class _BarcodeScreenState extends State<BarcodeScreen> {
  String? _svgBarcodePath;

  @override
  void initState() {
    super.initState();
    _generateAndSaveBarcode();
  }

  Future<void> _generateAndSaveBarcode() async {
    try {
      // Define the barcode data and type
      const String barcodeData = "123456789";
      const String fileName = "barcode.svg";

      // Create the barcode
      final Barcode code128 = Barcode.code128();
      final String svg = code128.toSvg(
        barcodeData,
        width: 300,
        height: 100,
      );

      // Save the SVG to local storage
      final directory = await getApplicationDocumentsDirectory();
      final filePath = "${directory.path}/$fileName";
      final file = File(filePath);
      await file.writeAsString(svg);

      setState(() {
        _svgBarcodePath = filePath;
      });

      print("Barcode saved at: $filePath");
    } catch (e) {
      print("Error generating barcode: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Barcode Generator'),
      ),
      body: Center(
        child: _svgBarcodePath == null
            ? const CircularProgressIndicator()
            : SvgPicture.file(
                File(_svgBarcodePath!), // Load and display the barcode SVG
                width: 300,
                height: 100,
              ),
      ),
    );
  }
}

////////////////////////// Barcode 2 //////////////////////////////////

// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:barcode/barcode.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:path_provider/path_provider.dart';

// void main() {
//   runApp(const BarcodeApp());
// }

// class BarcodeApp extends StatelessWidget {
//   const BarcodeApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: BarcodeScreen(),
//     );
//   }
// }

// class BarcodeScreen extends StatefulWidget {
//   @override
//   _BarcodeScreenState createState() => _BarcodeScreenState();
// }

// class _BarcodeScreenState extends State<BarcodeScreen> {
//   String? _svgBarcodePath;

//   @override
//   void initState() {
//     super.initState();
//     _generateAndSaveWifiBarcode();
//   }

//   Future<void> _generateAndSaveWifiBarcode() async {
//     try {
//       // Define WiFi details
//       const String wifiName = "Coreline IT Solution";
//       const String wifiPassword = "Password pataa nahi hai";
//       const String fileName = "wifi_barcode.svg";

//       // Create a DataMatrix barcode
//       final Barcode dataMatrix = Barcode.dataMatrix();

//       // Create a MeCard for WiFi configuration
//       final meCard = MeCard.wifi(
//         ssid: wifiName,
//         password: wifiPassword,
//       );

//       // Generate the DataMatrix barcode as SVG
//       final String svg = dataMatrix.toSvg(
//         meCard.toString(),
//         width: 200,
//         height: 200,
//       );

//       // Save the SVG to local storage
//       final directory = await getApplicationDocumentsDirectory();
//       final filePath = "${directory.path}/$fileName";
//       final file = File(filePath);
//       await file.writeAsString(svg);

//       setState(() {
//         _svgBarcodePath = filePath;
//       });

//       print("WiFi Barcode saved at: $filePath");
//     } catch (e) {
//       print("Error generating WiFi barcode: $e");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('WiFi Barcode Generator'),
//       ),
//       body: Center(
//         child: _svgBarcodePath == null
//             ? const CircularProgressIndicator()
//             : SvgPicture.file(
//                 File(_svgBarcodePath!), // Load and display the barcode SVG
//                 width: 200,
//                 height: 200,
//               ),
//       ),
//     );
//   }
// }
