import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

Future<void> counterSalePrintReceipt() async {
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
                pw.Text('Counter Sale',
                    style: pw.TextStyle(
                      fontSize: 9,
                      fontWeight: pw.FontWeight.bold,
                    )),
                pw.SizedBox(height: 2),
                pw.Text('Retailer Code:  TR003',
                    style: pw.TextStyle(
                        fontSize: 9,
                        fontWeight: pw.FontWeight.bold,
                        color: PdfColors.black)),
                pw.SizedBox(height: 2),
                pw.Text('18-01-2025  TO  18-01-2025',
                    style: pw.TextStyle(
                      fontSize: 8,
                      fontWeight: pw.FontWeight.bold,
                    )),
                pw.SizedBox(height: 2),
                pw.Divider(),
                pw.SizedBox(height: 1),
                pw.Text('PLAY:       10330',
                    style: pw.TextStyle(
                      fontSize: 8,
                      fontWeight: pw.FontWeight.bold,
                    )),
                pw.SizedBox(height: 5),
                pw.Text('WIN:       -10330',
                    style: pw.TextStyle(
                      fontSize: 8,
                      fontWeight: pw.FontWeight.bold,
                    )),
                pw.SizedBox(height: 1),
                pw.Divider(),
                pw.SizedBox(height: 3),
                pw.Text('Outstanding        -1000',
                    style: pw.TextStyle(
                      fontSize: 8,
                      fontWeight: pw.FontWeight.bold,
                    )),
                pw.SizedBox(height: 1),
                pw.Text('Server time 18-01-2025 12:56:45 PM',
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
