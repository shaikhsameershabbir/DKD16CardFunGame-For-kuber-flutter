import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class NetToPayPrint {
  static void netToPayPrintReceipt(username, fromDate, toDate, playPoint,
      winAmount, commission, nettopay, serverTime) async {
    final pdf = pw.Document();

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
                  pw.SizedBox(height: 5),
                  pw.Text('10KaDam',
                      style: pw.TextStyle(
                        fontSize: 9,
                        fontWeight: pw.FontWeight.bold,
                      )),
                  pw.SizedBox(height: 5),
                  pw.Text('Net To Pay',
                      style: pw.TextStyle(
                        fontSize: 9,
                        fontWeight: pw.FontWeight.bold,
                      )),
                  pw.SizedBox(height: 2),
                  pw.Text('Retailer Code:  $username',
                      style: pw.TextStyle(
                          fontSize: 9,
                          fontWeight: pw.FontWeight.bold,
                          color: PdfColors.black)),
                  pw.SizedBox(height: 2),
                  pw.Text('$fromDate  TO  $toDate',
                      style: pw.TextStyle(
                        fontSize: 8,
                        fontWeight: pw.FontWeight.bold,
                      )),
                  pw.SizedBox(height: 2),
                  pw.Divider(),
                  pw.SizedBox(height: 1),
                  pw.Text('PLAY:       $playPoint',
                      style: pw.TextStyle(
                        fontSize: 8,
                        fontWeight: pw.FontWeight.bold,
                      )),
                  pw.SizedBox(height: 5),
                  pw.Text('WIN:       $winAmount',
                      style: pw.TextStyle(
                        fontSize: 8,
                        fontWeight: pw.FontWeight.bold,
                      )),
                  pw.SizedBox(height: 5),
                  pw.Text('Commission:       $commission',
                      style: pw.TextStyle(
                        fontSize: 8,
                        fontWeight: pw.FontWeight.bold,
                      )),
                  pw.SizedBox(height: 5),
                  pw.Text('Retailer Bonus:       -0',
                      style: pw.TextStyle(
                        fontSize: 8,
                        fontWeight: pw.FontWeight.bold,
                      )),
                  pw.SizedBox(height: 1),
                  pw.Divider(),
                  pw.SizedBox(height: 3),
                  pw.Text('Outstanding        $nettopay',
                      style: pw.TextStyle(
                        fontSize: 8,
                        fontWeight: pw.FontWeight.bold,
                      )),
                  pw.SizedBox(height: 1),
                  pw.Text('$serverTime',
                      style: pw.TextStyle(
                        fontSize: 8,
                        fontWeight: pw.FontWeight.bold,
                      )),
                  pw.SizedBox(height: 3),
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
//           await netToPayPrintReceipt();
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
