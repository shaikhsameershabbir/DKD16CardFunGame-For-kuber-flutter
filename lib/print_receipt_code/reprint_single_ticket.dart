import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:kuber/constants/get_formatted_date.dart';
import 'package:path_provider/path_provider.dart';
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:barcode/barcode.dart';

class ReprintSingleTicket {
  static Future<void> printSingleTicketReceipt(dynamic data) async {
    final pdf = pw.Document();

    ////////////////////////////////////////////////////////////////////
    // Extract values and store them as strings
    String success = data["status"].toString();
    // String message = data["message"].toString();

    // Extract bet details (assuming there's only one bet in the list)
    var bet = data["bets"].first;

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

    // Manually adding bet values since no loop is needed
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
    final String svg = code128.toSvg(bet["ticketId"].toString(),
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

                  // Table layout for bets
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

                  // Add more rows as needed (bet 4-12, etc.)
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

                  pw.SizedBox(height: 1),

                  // Print the points
                  pw.Text('Points : $betTotal',
                      style: pw.TextStyle(
                        fontSize: 8,
                        fontWeight: pw.FontWeight.bold,
                      )),
                  pw.SizedBox(height: 1),

                  // Print ticketId, confirm time, and other details
                  pw.Text(bet["ticketId"].toString(),
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
