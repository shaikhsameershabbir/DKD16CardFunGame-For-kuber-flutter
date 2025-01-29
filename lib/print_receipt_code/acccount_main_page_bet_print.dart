import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:kuber/constants/get_formatted_date.dart';
import 'package:path_provider/path_provider.dart';
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:barcode/barcode.dart';

class AcccountMainPageBetPrint {
  static Future<void> mainPageBetPrintReceipt(dynamic data) async {
    final pdf = pw.Document();

    ////////////////////////////////////////////////////////////////////
    // Extract values and store them as strings
    String success = data["success"].toString();
    String message = data["message"].toString();
    String ticketId = data["ticketId"].toString();

    // Extract first bet details
    var bet = data["betst"][0];

    String drawTime = bet["drawTime"].toString();
    String drawDate = "${formatDate(bet["drawDate"])} $drawTime";
    String betTotal = bet["betTotal"].toString();
    String winAmount = bet["winAmount"].toString();
    String confirmTime = getCurrentDateTime();
    String userId = bet["userId"].toString();
    String username =
        bet["username"][0].toString() + bet["username"].toString().substring(1);

    Map<String, String> bets = {};
    List<String> betKeys = [];
    List<String> betValues = [];
    int index = betKeys.length;

    for (int i = 1; i <= 12; i++) {
      String value = bet["bet$i"].toString();
      if (value != "0") {
        bets["bet$i"] = value;
        betKeys.add("$i");
        betValues.add(value);
      } else {
        betKeys.add("");
        betValues.add('');
      }
    }

    // print("Filtered bet keys: $betKeys");
    // print("Filtered bet values: $betValues");

    // // Print values
    // print("Username: $username");
    // print("Success: $success");
    // print("Message: $message");
    // print("Ticket ID: $ticketId");
    // print("Draw Date: $drawDate");

    // print("Bet Total: $betTotal");
    // print("Win Amount: $winAmount");
    // print("Confirm Time: $confirmTime");
    // print("User ID: $userId");

    ////////////////////////////////////////////////////////////////////

    // Generate Barcode SVG
    // const String barcodeData = "123456789";
    final Barcode code128 = Barcode.code39();
    final String svg =
        code128.toSvg(ticketId, width: 120, height: 50, drawText: false);

    // Save Barcode SVG to local storage
    final directory = await getApplicationDocumentsDirectory();
    final filePath = "${directory.path}/barcode.svg";
    final file = File(filePath);
    await file.writeAsString(svg);

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Padding(
              padding: pw.EdgeInsets.only(left: -50, top: -50),
              child: pw.Column(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                children: [
                  pw.Container(
                      margin: pw.EdgeInsets.only(right: 2),
                      width: 25,
                      height: 25,
                      decoration: pw.BoxDecoration(
                          shape: pw.BoxShape.circle,
                          border:
                              pw.Border.all(color: PdfColors.black, width: 4)),
                      child: pw.Center(
                          child: pw.Text("K",
                              style: pw.TextStyle(
                                  color: PdfColors.black,
                                  fontWeight: pw.FontWeight.bold,
                                  fontSize: 15)))),
                  pw.SizedBox(height: 2),
                  pw.Text('FOR AMUSEMENT ONLY',
                      style: pw.TextStyle(
                          fontSize: 9,
                          fontWeight: pw.FontWeight.bold,
                          color: PdfColors.black)),
                  pw.SizedBox(height: 2),
                  pw.Text('Dus Ka Dum',
                      style: pw.TextStyle(
                        fontSize: 9,
                        fontWeight: pw.FontWeight.bold,
                      )),
                  pw.SizedBox(height: 2),
                  pw.Text('Draw : $drawDate',
                      style: pw.TextStyle(
                        fontSize: 8,
                        fontWeight: pw.FontWeight.bold,
                      )),
                  pw.SizedBox(height: 2),

                  pw.Container(
                    width: 100,
                    height: 10,
                    child: pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Text('No',
                            style: pw.TextStyle(
                                fontSize: 8,
                                fontWeight: pw.FontWeight.bold,
                                color: PdfColors.black)),
                        pw.Text('qty',
                            style: pw.TextStyle(
                                fontSize: 8,
                                fontWeight: pw.FontWeight.bold,
                                color: PdfColors.black)),
                        pw.Text('No',
                            style: pw.TextStyle(
                                fontSize: 8,
                                fontWeight: pw.FontWeight.bold,
                                color: PdfColors.black)),
                        pw.Text('qty',
                            style: pw.TextStyle(
                                fontSize: 8,
                                fontWeight: pw.FontWeight.bold,
                                color: PdfColors.black)),
                        pw.Text('No',
                            style: pw.TextStyle(
                                fontSize: 8,
                                fontWeight: pw.FontWeight.bold,
                                color: PdfColors.black)),
                        pw.Text('qty',
                            style: pw.TextStyle(
                                fontSize: 8,
                                fontWeight: pw.FontWeight.bold,
                                color: PdfColors.black)),
                      ],
                    ),
                  ),

                  pw.SizedBox(height: 4),

                  pw.Container(
                    width: 100,
                    height: 10,
                    child: pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Text(betKeys[0],
                            style: pw.TextStyle(
                                fontSize: 8,
                                fontWeight: pw.FontWeight.bold,
                                color: PdfColors.black)),
                        pw.Text(betValues[0],
                            style: pw.TextStyle(
                                fontSize: 8,
                                fontWeight: pw.FontWeight.bold,
                                color: PdfColors.black)),
                        pw.Text(betKeys[1],
                            style: pw.TextStyle(
                                fontSize: 8,
                                fontWeight: pw.FontWeight.bold,
                                color: PdfColors.black)),
                        pw.Text(betValues[1],
                            style: pw.TextStyle(
                                fontSize: 8,
                                fontWeight: pw.FontWeight.bold,
                                color: PdfColors.black)),
                        pw.Text(betKeys[2],
                            style: pw.TextStyle(
                                fontSize: 8,
                                fontWeight: pw.FontWeight.bold,
                                color: PdfColors.black)),
                        pw.Text(betValues[2],
                            style: pw.TextStyle(
                                fontSize: 8,
                                fontWeight: pw.FontWeight.bold,
                                color: PdfColors.black)),
                      ],
                    ),
                  ),

                  pw.Container(
                    width: 100,
                    height: 10,
                    child: pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Text(betKeys[3],
                            style: pw.TextStyle(
                                fontSize: 8,
                                fontWeight: pw.FontWeight.bold,
                                color: PdfColors.black)),
                        pw.Text(betValues[3],
                            style: pw.TextStyle(
                                fontSize: 8,
                                fontWeight: pw.FontWeight.bold,
                                color: PdfColors.black)),
                        pw.Text(betKeys[4],
                            style: pw.TextStyle(
                                fontSize: 8,
                                fontWeight: pw.FontWeight.bold,
                                color: PdfColors.black)),
                        pw.Text(betValues[4],
                            style: pw.TextStyle(
                                fontSize: 8,
                                fontWeight: pw.FontWeight.bold,
                                color: PdfColors.black)),
                        pw.Text(betKeys[5],
                            style: pw.TextStyle(
                                fontSize: 8,
                                fontWeight: pw.FontWeight.bold,
                                color: PdfColors.black)),
                        pw.Text(betValues[5],
                            style: pw.TextStyle(
                                fontSize: 8,
                                fontWeight: pw.FontWeight.bold,
                                color: PdfColors.black)),
                      ],
                    ),
                  ),
                  pw.Container(
                    width: 100,
                    height: 10,
                    child: pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Text(betKeys[6],
                            style: pw.TextStyle(
                                fontSize: 8,
                                fontWeight: pw.FontWeight.bold,
                                color: PdfColors.black)),
                        pw.Text(betValues[6],
                            style: pw.TextStyle(
                                fontSize: 8,
                                fontWeight: pw.FontWeight.bold,
                                color: PdfColors.black)),
                        pw.Text(betKeys[7],
                            style: pw.TextStyle(
                                fontSize: 8,
                                fontWeight: pw.FontWeight.bold,
                                color: PdfColors.black)),
                        pw.Text(betValues[7],
                            style: pw.TextStyle(
                                fontSize: 8,
                                fontWeight: pw.FontWeight.bold,
                                color: PdfColors.black)),
                        pw.Text(betKeys[8],
                            style: pw.TextStyle(
                                fontSize: 8,
                                fontWeight: pw.FontWeight.bold,
                                color: PdfColors.black)),
                        pw.Text(betValues[8],
                            style: pw.TextStyle(
                                fontSize: 8,
                                fontWeight: pw.FontWeight.bold,
                                color: PdfColors.black)),
                      ],
                    ),
                  ),

                  pw.Container(
                    width: 100,
                    height: 10,
                    child: pw.Row(
                      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      children: [
                        pw.Text(betKeys[9],
                            style: pw.TextStyle(
                                fontSize: 8,
                                fontWeight: pw.FontWeight.bold,
                                color: PdfColors.black)),
                        pw.Text(betValues[9],
                            style: pw.TextStyle(
                                fontSize: 8,
                                fontWeight: pw.FontWeight.bold,
                                color: PdfColors.black)),
                        pw.Text(betKeys[10],
                            style: pw.TextStyle(
                                fontSize: 8,
                                fontWeight: pw.FontWeight.bold,
                                color: PdfColors.black)),
                        pw.Text(betValues[10],
                            style: pw.TextStyle(
                                fontSize: 8,
                                fontWeight: pw.FontWeight.bold,
                                color: PdfColors.black)),
                        pw.Text(betKeys[11],
                            style: pw.TextStyle(
                                fontSize: 8,
                                fontWeight: pw.FontWeight.bold,
                                color: PdfColors.black)),
                        pw.Text(betValues[11],
                            style: pw.TextStyle(
                                fontSize: 8,
                                fontWeight: pw.FontWeight.bold,
                                color: PdfColors.black)),
                      ],
                    ),
                  ),

                  pw.SizedBox(height: 1),

                  // pw.Divider(),
                  pw.Text('Points : $betTotal',
                      style: pw.TextStyle(
                        fontSize: 8,
                        fontWeight: pw.FontWeight.bold,
                      )),
                  pw.SizedBox(height: 1),

                  pw.Text(ticketId,
                      style: pw.TextStyle(
                        fontSize: 8,
                        fontWeight: pw.FontWeight.bold,
                      )),
                  pw.SizedBox(height: 1),

                  pw.Text(confirmTime,
                      style: pw.TextStyle(
                        fontSize: 8,
                        fontWeight: pw.FontWeight.bold,
                      )),
                  pw.SizedBox(height: 1),

                  pw.Text('GSTN : Under Process...',
                      style: pw.TextStyle(
                        fontSize: 8,
                        fontWeight: pw.FontWeight.bold,
                      )),
                  pw.SizedBox(height: 1),

                  pw.Text('Agent : $username',
                      style: pw.TextStyle(
                        fontSize: 8,
                        fontWeight: pw.FontWeight.bold,
                      )),
                  pw.SizedBox(height: 5),
                  pw.SvgImage(svg: svg),
                ],
              ));
        },
      ),
    );

    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
  }
}


// class PrintReceiptButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: () async {
//         try {
//           await mainPageBetPrintReceipt();
//         } catch (e) {
//           print(e.toString());
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text(e.toString())),
//           );
//         }
//       },
//       child: Text('Print Receipt'),
//     );
//   }
// }

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Thermal Printer Example'),
//         ),
//         body: Center(
//           child: PrintReceiptButton(),
//         ),
//       ),
//     );
//   }
// }






















////////// barcode testing ///////////
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter_thermal_printer/flutter_thermal_printer.dart';
// import 'package:flutter_thermal_printer/utils/printer.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;
// import 'package:barcode/barcode.dart';
// import 'package:path_provider/path_provider.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   final _formKey = GlobalKey<FormState>();
//   String _name = '';
//   String _barcodeNumber = '';

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Barcode PDF Generator'),
//         ),
//         body: Padding(
//           padding: EdgeInsets.all(16.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               children: <Widget>[
//                 TextFormField(
//                   decoration: InputDecoration(labelText: 'Name'),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter your name';
//                     }
//                     return null;
//                   },
//                   onSaved: (value) => _name = value!,
//                 ),
//                 TextFormField(
//                   decoration: InputDecoration(labelText: 'Barcode Number'),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter a barcode number';
//                     }
//                     return null;
//                   },
//                   onSaved: (value) => _barcodeNumber = value!,
//                 ),
//                 SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: () {
//                     if (_formKey.currentState!.validate()) {
//                       _formKey.currentState!.save();
//                       _generatePdf();
//                     }
//                   },
//                   child: Text('Generate PDF'),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Future<void> _generatePdf() async {
//     final pdf = pw.Document();

//     pdf.addPage(
//       pw.Page(
//         pageFormat: PdfPageFormat.roll57,
//         build: (context) {
//           return pw.Center(
//             child: pw.Column(
//               mainAxisAlignment: pw.MainAxisAlignment.center,
//               children: [
//                 pw.Text(
//                   'FOR AMUSEMENT ONLY',
//                   style: pw.TextStyle(
//                       fontSize: 18, fontWeight: pw.FontWeight.bold),
//                 ),
//                 pw.SizedBox(height: 20),
//                 pw.BarcodeWidget(
//                   barcode: Barcode.code128(),
//                   data: _barcodeNumber,
//                   width: 200,
//                   height: 50,
//                 ),
//                 pw.SizedBox(height: 20),
//                 pw.Text('Name: $_name'),
//               ],
//             ),
//           );
//         },
//       ),
//     );

//     final bytes = await pdf.save();

//     // Get the desktop directory for Windows
//     final directory = await getDesktopDirectory();
//     final pdfDir = Directory('${directory.path}/pdf');
//     await pdfDir.create(
//         recursive: true); // Create the pdf folder if it doesn't exist

//     // Save the PDF to the desktop
//     final file = File('${pdfDir.path}/barcode_pdf.pdf');
//     await file.writeAsBytes(bytes);

//     print('PDF saved successfully to: ${file.path}');
//   }

//   // This function gets the desktop directory for Windows
//   Future<Directory> getDesktopDirectory() async {
//     final directory = await getApplicationDocumentsDirectory();
//     final desktopPath =
//         Directory('${directory.path}/../Desktop'); // Construct desktop path
//     return desktopPath;
//   }
// }

/// above code is generating pdf
/// below code is updation of above
// ignore_for_file: depend_on_referenced_packages

// import 'dart:async';
// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_thermal_printer/flutter_thermal_printer.dart';
// import 'package:flutter_thermal_printer/utils/printer.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   final _flutterThermalPrinterPlugin = FlutterThermalPrinter.instance;

//   String _ip = '192.168.0.100';
//   String _port = '9100';

//   List<Printer> printers = [];

//   StreamSubscription<List<Printer>>? _devicesStreamSubscription;

//   // Get Printer List
//   void startScan() async {
//     _devicesStreamSubscription?.cancel();
//     await _flutterThermalPrinterPlugin.getPrinters(connectionTypes: [
//       ConnectionType.USB,
//       // ConnectionType.BLE,
//     ]);
//     _devicesStreamSubscription = _flutterThermalPrinterPlugin.devicesStream
//         .listen((List<Printer> event) {
//       log(event.map((e) => e.name).toList().toString());
//       setState(() {
//         printers = event;
//         printers.removeWhere(
//             (element) => element.name == null || element.name == '');
//       });
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       startScan();
//     });
//   }

//   stopScan() {
//     _flutterThermalPrinterPlugin.stopScan();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('PDF Printing Example'),
//           systemOverlayStyle: const SystemUiOverlayStyle(
//             statusBarColor: Colors.transparent,
//           ),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 'USB/BLE',
//                 style: Theme.of(context).textTheme.titleLarge,
//               ),
//               const SizedBox(height: 22),
//               Row(
//                 children: [
//                   Expanded(
//                     child: ElevatedButton(
//                       onPressed: () {
//                         startScan();
//                       },
//                       child: const Text('Get Printers'),
//                     ),
//                   ),
//                   const SizedBox(width: 22),
//                   Expanded(
//                     child: ElevatedButton(
//                       onPressed: () {
//                         stopScan();
//                       },
//                       child: const Text('Stop Scan'),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 12),
//               Expanded(
//                 child: ListView.builder(
//                   itemCount: printers.length,
//                   itemBuilder: (context, index) {
//                     return ListTile(
//                       onTap: () async {
//                         if (printers[index].isConnected ?? false) {
//                           await _flutterThermalPrinterPlugin
//                               .disconnect(printers[index]);
//                         } else {
//                           await _flutterThermalPrinterPlugin
//                               .connect(printers[index]);
//                         }
//                       },
//                       title: Text(printers[index].name ?? 'No Name'),
//                       subtitle:
//                           Text("Connected: ${printers[index].isConnected}"),
//                       trailing: IconButton(
//                         icon: const Icon(Icons.connect_without_contact),
//                         onPressed: () async {
//                           await _generateAndPrintReceipt(printers[index]);
//                         },
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Future<void> _generateAndPrintReceipt(Printer printer) async {
//     // Create a simple receipt widget (instead of text)
//     final receiptWidget = Material(
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Center(
//               child: Text(
//                 'Invoice',
//                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//               ),
//             ),
//             const Divider(),
//             const SizedBox(height: 10),
//             _buildReceiptRow('Item', 'Price'),
//             const Divider(),
//             _buildReceiptRow('Apple', '\$1.00'),
//             _buildReceiptRow('Banana', '\$0.50'),
//             _buildReceiptRow('Orange', '\$0.75'),
//             const Divider(thickness: 2),
//             _buildReceiptRow('Total', '\$2.25', isBold: true),
//             const SizedBox(height: 20),
//             const Center(
//               child: Text(
//                 'Thank you for your purchase!',
//                 style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );

//     // Print the widget
//     await _flutterThermalPrinterPlugin.printWidget(
//       context,
//       printer: printer,
//       widget: receiptWidget,
//     );
//   }
// }

// Widget _buildReceiptRow(String leftText, String rightText,
//     {bool isBold = false}) {
//   return Padding(
//     padding: const EdgeInsets.symmetric(vertical: 4.0),
//     child: Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           leftText,
//           style: TextStyle(
//               fontSize: 16,
//               fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
//         ),
//         Text(
//           rightText,
//           style: TextStyle(
//               fontSize: 16,
//               fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
//         ),
//       ],
//     ),
//   );
// }

///////////////////////////////////////////
// import 'package:flutter/material.dart';
// import 'package:printing/printing.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;

// Future<void> printHello() async {
//   final pdf = pw.Document();

//   pdf.addPage(
//     pw.Page(
//       build: (pw.Context context) {
//         return pw.Center(
//           child: pw.Text('Hello', style: pw.TextStyle(fontSize: 40)),
//         );
//       },
//     ),
//   );

//   await Printing.layoutPdf(
//     onLayout: (PdfPageFormat format) async => pdf.save(),
//   );
// }

// class PrintHelloButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: () async {
//         try {
//           await printHello();
//         } catch (e) {
//           print(e.toString());
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text(e.toString())),
//           );
//         }
//       },
//       child: Text('Print Hello'),
//     );
//   }
// }

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Thermal Printer Example'),
//         ),
//         body: Center(
//           child: PrintHelloButton(),
//         ),
//       ),
//     );
//   }
// }

//////////////// dont delete above code //////////

