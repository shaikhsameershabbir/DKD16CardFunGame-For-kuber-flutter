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

    // Check if ticketId is a single string, single integer, or list
    var ticketIds = data["ticketId"];
    if (ticketIds is String || ticketIds is int) {
      // Single ticket ID, convert to list
      ticketIds = [ticketIds.toString()];
    } else if (ticketIds is List) {
      // It's already a list, make sure all items are strings
      ticketIds = ticketIds.map((ticket) => ticket.toString()).toList();
    }

    // Extract bet details for each ticketId
    for (var ticketId in ticketIds) {
      // Extract first bet details
      var bet = data["betst"].firstWhere(
          (bet) => bet["ticketId"].toString() == ticketId.toString());

      String drawTime = bet["drawTime"].toString();
      String drawDate = "${formatDate(bet["drawDate"])} $drawTime";
      String betTotal = bet["betTotal"].toString();
      String winAmount = bet["winAmount"].toString();
      String confirmTime = getCurrentDateTime();
      String userId = bet["userId"].toString();
      String username = bet["username"][0].toString() +
          bet["username"].toString().substring(1);

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

      ////////////////////////////////////////////////////////////////////

      // Generate Barcode SVG
      final Barcode code128 = Barcode.code39();
      final String svg = code128.toSvg(ticketId.toString(),
          width: 120, height: 50, drawText: false);

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
                            border: pw.Border.all(
                                color: PdfColors.black, width: 4)),
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

                    pw.Text(ticketId.toString(),
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
    }

    await Printing.layoutPdf(
      onLayout: (PdfPageFormat format) async => pdf.save(),
    );
  }
}



// class AcccountMainPageBetPrint {
//   static Future<void> mainPageBetPrintReceipt(dynamic data) async {
//     final pdf = pw.Document();

//     ////////////////////////////////////////////////////////////////////
//     // Extract values and store them as strings
//     String success = data["success"].toString();
//     String message = data["message"].toString();
//     String ticketId = data["ticketId"].toString();

//     // Extract first bet details
//     var bet = data["betst"][0];

//     String drawTime = bet["drawTime"].toString();
//     String drawDate = "${formatDate(bet["drawDate"])} $drawTime";
//     String betTotal = bet["betTotal"].toString();
//     String winAmount = bet["winAmount"].toString();
//     String confirmTime = getCurrentDateTime();
//     String userId = bet["userId"].toString();
//     String username =
//         bet["username"][0].toString() + bet["username"].toString().substring(1);

//     Map<String, String> bets = {};
//     List<String> betKeys = [];
//     List<String> betValues = [];
//     int index = betKeys.length;

//     for (int i = 1; i <= 12; i++) {
//       String value = bet["bet$i"].toString();
//       if (value != "0") {
//         bets["bet$i"] = value;
//         betKeys.add("$i");
//         betValues.add(value);
//       } else {
//         betKeys.add("");
//         betValues.add('');
//       }
//     }

//     // print("Filtered bet keys: $betKeys");
//     // print("Filtered bet values: $betValues");

//     // // Print values
//     // print("Username: $username");
//     // print("Success: $success");
//     // print("Message: $message");
//     // print("Ticket ID: $ticketId");
//     // print("Draw Date: $drawDate");

//     // print("Bet Total: $betTotal");
//     // print("Win Amount: $winAmount");
//     // print("Confirm Time: $confirmTime");
//     // print("User ID: $userId");

//     ////////////////////////////////////////////////////////////////////

//     // Generate Barcode SVG
   
//     final Barcode code128 = Barcode.code39();
//     final String svg =
//         code128.toSvg(ticketId, width: 120, height: 50, drawText: false);

//     // Save Barcode SVG to local storage
//     final directory = await getApplicationDocumentsDirectory();
//     final filePath = "${directory.path}/barcode.svg";
//     final file = File(filePath);
//     await file.writeAsString(svg);

//     pdf.addPage(
//       pw.Page(
//         build: (pw.Context context) {
//           return pw.Padding(
//               padding: pw.EdgeInsets.only(left: -50, top: -50),
//               child: pw.Column(
//                 crossAxisAlignment: pw.CrossAxisAlignment.start,
//                 children: [
//                   pw.Container(
//                       margin: pw.EdgeInsets.only(right: 2),
//                       width: 25,
//                       height: 25,
//                       decoration: pw.BoxDecoration(
//                           shape: pw.BoxShape.circle,
//                           border:
//                               pw.Border.all(color: PdfColors.black, width: 4)),
//                       child: pw.Center(
//                           child: pw.Text("K",
//                               style: pw.TextStyle(
//                                   color: PdfColors.black,
//                                   fontWeight: pw.FontWeight.bold,
//                                   fontSize: 15)))),
//                   pw.SizedBox(height: 2),
//                   pw.Text('FOR AMUSEMENT ONLY',
//                       style: pw.TextStyle(
//                           fontSize: 9,
//                           fontWeight: pw.FontWeight.bold,
//                           color: PdfColors.black)),
//                   pw.SizedBox(height: 2),
//                   pw.Text('Dus Ka Dum',
//                       style: pw.TextStyle(
//                         fontSize: 9,
//                         fontWeight: pw.FontWeight.bold,
//                       )),
//                   pw.SizedBox(height: 2),
//                   pw.Text('Draw : $drawDate',
//                       style: pw.TextStyle(
//                         fontSize: 8,
//                         fontWeight: pw.FontWeight.bold,
//                       )),
//                   pw.SizedBox(height: 2),

//                   pw.Container(
//                     width: 100,
//                     height: 10,
//                     child: pw.Row(
//                       mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//                       children: [
//                         pw.Text('No',
//                             style: pw.TextStyle(
//                                 fontSize: 8,
//                                 fontWeight: pw.FontWeight.bold,
//                                 color: PdfColors.black)),
//                         pw.Text('qty',
//                             style: pw.TextStyle(
//                                 fontSize: 8,
//                                 fontWeight: pw.FontWeight.bold,
//                                 color: PdfColors.black)),
//                         pw.Text('No',
//                             style: pw.TextStyle(
//                                 fontSize: 8,
//                                 fontWeight: pw.FontWeight.bold,
//                                 color: PdfColors.black)),
//                         pw.Text('qty',
//                             style: pw.TextStyle(
//                                 fontSize: 8,
//                                 fontWeight: pw.FontWeight.bold,
//                                 color: PdfColors.black)),
//                         pw.Text('No',
//                             style: pw.TextStyle(
//                                 fontSize: 8,
//                                 fontWeight: pw.FontWeight.bold,
//                                 color: PdfColors.black)),
//                         pw.Text('qty',
//                             style: pw.TextStyle(
//                                 fontSize: 8,
//                                 fontWeight: pw.FontWeight.bold,
//                                 color: PdfColors.black)),
//                       ],
//                     ),
//                   ),

//                   pw.SizedBox(height: 4),

//                   pw.Container(
//                     width: 100,
//                     height: 10,
//                     child: pw.Row(
//                       mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//                       children: [
//                         pw.Text(betKeys[0],
//                             style: pw.TextStyle(
//                                 fontSize: 8,
//                                 fontWeight: pw.FontWeight.bold,
//                                 color: PdfColors.black)),
//                         pw.Text(betValues[0],
//                             style: pw.TextStyle(
//                                 fontSize: 8,
//                                 fontWeight: pw.FontWeight.bold,
//                                 color: PdfColors.black)),
//                         pw.Text(betKeys[1],
//                             style: pw.TextStyle(
//                                 fontSize: 8,
//                                 fontWeight: pw.FontWeight.bold,
//                                 color: PdfColors.black)),
//                         pw.Text(betValues[1],
//                             style: pw.TextStyle(
//                                 fontSize: 8,
//                                 fontWeight: pw.FontWeight.bold,
//                                 color: PdfColors.black)),
//                         pw.Text(betKeys[2],
//                             style: pw.TextStyle(
//                                 fontSize: 8,
//                                 fontWeight: pw.FontWeight.bold,
//                                 color: PdfColors.black)),
//                         pw.Text(betValues[2],
//                             style: pw.TextStyle(
//                                 fontSize: 8,
//                                 fontWeight: pw.FontWeight.bold,
//                                 color: PdfColors.black)),
//                       ],
//                     ),
//                   ),

//                   pw.Container(
//                     width: 100,
//                     height: 10,
//                     child: pw.Row(
//                       mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//                       children: [
//                         pw.Text(betKeys[3],
//                             style: pw.TextStyle(
//                                 fontSize: 8,
//                                 fontWeight: pw.FontWeight.bold,
//                                 color: PdfColors.black)),
//                         pw.Text(betValues[3],
//                             style: pw.TextStyle(
//                                 fontSize: 8,
//                                 fontWeight: pw.FontWeight.bold,
//                                 color: PdfColors.black)),
//                         pw.Text(betKeys[4],
//                             style: pw.TextStyle(
//                                 fontSize: 8,
//                                 fontWeight: pw.FontWeight.bold,
//                                 color: PdfColors.black)),
//                         pw.Text(betValues[4],
//                             style: pw.TextStyle(
//                                 fontSize: 8,
//                                 fontWeight: pw.FontWeight.bold,
//                                 color: PdfColors.black)),
//                         pw.Text(betKeys[5],
//                             style: pw.TextStyle(
//                                 fontSize: 8,
//                                 fontWeight: pw.FontWeight.bold,
//                                 color: PdfColors.black)),
//                         pw.Text(betValues[5],
//                             style: pw.TextStyle(
//                                 fontSize: 8,
//                                 fontWeight: pw.FontWeight.bold,
//                                 color: PdfColors.black)),
//                       ],
//                     ),
//                   ),
//                   pw.Container(
//                     width: 100,
//                     height: 10,
//                     child: pw.Row(
//                       mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//                       children: [
//                         pw.Text(betKeys[6],
//                             style: pw.TextStyle(
//                                 fontSize: 8,
//                                 fontWeight: pw.FontWeight.bold,
//                                 color: PdfColors.black)),
//                         pw.Text(betValues[6],
//                             style: pw.TextStyle(
//                                 fontSize: 8,
//                                 fontWeight: pw.FontWeight.bold,
//                                 color: PdfColors.black)),
//                         pw.Text(betKeys[7],
//                             style: pw.TextStyle(
//                                 fontSize: 8,
//                                 fontWeight: pw.FontWeight.bold,
//                                 color: PdfColors.black)),
//                         pw.Text(betValues[7],
//                             style: pw.TextStyle(
//                                 fontSize: 8,
//                                 fontWeight: pw.FontWeight.bold,
//                                 color: PdfColors.black)),
//                         pw.Text(betKeys[8],
//                             style: pw.TextStyle(
//                                 fontSize: 8,
//                                 fontWeight: pw.FontWeight.bold,
//                                 color: PdfColors.black)),
//                         pw.Text(betValues[8],
//                             style: pw.TextStyle(
//                                 fontSize: 8,
//                                 fontWeight: pw.FontWeight.bold,
//                                 color: PdfColors.black)),
//                       ],
//                     ),
//                   ),

//                   pw.Container(
//                     width: 100,
//                     height: 10,
//                     child: pw.Row(
//                       mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//                       children: [
//                         pw.Text(betKeys[9],
//                             style: pw.TextStyle(
//                                 fontSize: 8,
//                                 fontWeight: pw.FontWeight.bold,
//                                 color: PdfColors.black)),
//                         pw.Text(betValues[9],
//                             style: pw.TextStyle(
//                                 fontSize: 8,
//                                 fontWeight: pw.FontWeight.bold,
//                                 color: PdfColors.black)),
//                         pw.Text(betKeys[10],
//                             style: pw.TextStyle(
//                                 fontSize: 8,
//                                 fontWeight: pw.FontWeight.bold,
//                                 color: PdfColors.black)),
//                         pw.Text(betValues[10],
//                             style: pw.TextStyle(
//                                 fontSize: 8,
//                                 fontWeight: pw.FontWeight.bold,
//                                 color: PdfColors.black)),
//                         pw.Text(betKeys[11],
//                             style: pw.TextStyle(
//                                 fontSize: 8,
//                                 fontWeight: pw.FontWeight.bold,
//                                 color: PdfColors.black)),
//                         pw.Text(betValues[11],
//                             style: pw.TextStyle(
//                                 fontSize: 8,
//                                 fontWeight: pw.FontWeight.bold,
//                                 color: PdfColors.black)),
//                       ],
//                     ),
//                   ),

//                   pw.SizedBox(height: 1),

//                   // pw.Divider(),
//                   pw.Text('Points : $betTotal',
//                       style: pw.TextStyle(
//                         fontSize: 8,
//                         fontWeight: pw.FontWeight.bold,
//                       )),
//                   pw.SizedBox(height: 1),

//                   pw.Text(ticketId,
//                       style: pw.TextStyle(
//                         fontSize: 8,
//                         fontWeight: pw.FontWeight.bold,
//                       )),
//                   pw.SizedBox(height: 1),

//                   pw.Text(confirmTime,
//                       style: pw.TextStyle(
//                         fontSize: 8,
//                         fontWeight: pw.FontWeight.bold,
//                       )),
//                   pw.SizedBox(height: 1),

//                   pw.Text('GSTN : Under Process...',
//                       style: pw.TextStyle(
//                         fontSize: 8,
//                         fontWeight: pw.FontWeight.bold,
//                       )),
//                   pw.SizedBox(height: 1),

//                   pw.Text('Agent : $username',
//                       style: pw.TextStyle(
//                         fontSize: 8,
//                         fontWeight: pw.FontWeight.bold,
//                       )),
//                   pw.SizedBox(height: 5),
//                   pw.SvgImage(svg: svg),
//                 ],
//               ));
//         },
//       ),
//     );

//     await Printing.layoutPdf(
//       onLayout: (PdfPageFormat format) async => pdf.save(),
//     );
//   }
// }

