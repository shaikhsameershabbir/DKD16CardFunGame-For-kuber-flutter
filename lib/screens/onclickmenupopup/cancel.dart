import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:kuber/cubit/auth_cubit.dart';
import 'package:kuber/widgets/custom_button.dart';
import 'package:kuber/widgets/show_dialog.dart';
import 'package:sizer/sizer.dart';

void cancelDialog(context, width, height, Function onDialogClosed) {
  print("inside dialog box");

  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      context.read<AuthCubit>().listenForBalanceUpdates();
      return Dialog(
        child: Container(
          width: width * 0.70, // Set the desired width
          height: height * 0.52, // Set the desired height
          color: Colors.white,

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Header Section
              Container(
                width: width * 0.9,
                height: height * 0.05,
                color: Color(0xFF5499c7),
                child: Row(
                  children: [
                    SizedBox(width: 60, height: 60),
                    Spacer(),
                    Text(
                      "CANCEL",
                      style: TextStyle(
                          fontSize: 15.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context); // Close the dialog
                        onDialogClosed(context);
                      },
                      child: Image.asset("assets/duskadam/closewindow.png"),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              CancelMenuTable()
            ],
          ),
        ),
      );
    },
  );
}

class CancelMenuTable extends StatefulWidget {
  const CancelMenuTable({super.key});

  @override
  State<CancelMenuTable> createState() => _CancelMenuTableState();
}

class _CancelMenuTableState extends State<CancelMenuTable> {
  String formatDate(String dateStr) {
    DateTime dateTime = DateTime.parse(dateStr);
    return DateFormat("dd-MM-yyyy").format(dateTime);
  }

  @override
  Widget build(BuildContext context) {
    print("Building CancelMenuTable UI");

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        List<Map<String, dynamic>> tickets = [];
        print("print state 1 ");
        print(state);

        if (state is AuthCurrentDrawTicketsLoaded) {
          tickets = state.tickets;
        }

        return Container(
          width: screenWidth * 0.6,
          color: Colors.white,
          child: SingleChildScrollView(
            child: Table(
              border: TableBorder.all(
                color: Colors.grey,
                width: 0.5,
              ),
              columnWidths: {
                0: FlexColumnWidth(0.5), // Sr.No
                1: FlexColumnWidth(1.2), // Ticket Id
                2: FlexColumnWidth(1.2), // Draw Date
                3: FlexColumnWidth(1.2), // Draw Time
                4: FlexColumnWidth(1.0), // Total Points
                5: FlexColumnWidth(0.8), // Action
              },
              children: [
                // Header Row
                TableRow(
                  decoration: BoxDecoration(
                    color: Color(0xFF87ceea), // Light blue color
                  ),
                  children: [
                    TableCell(child: _buildHeaderCell('Sr.No')),
                    TableCell(child: _buildHeaderCell('Ticket Id')),
                    TableCell(child: _buildHeaderCell('Draw Date')),
                    TableCell(child: _buildHeaderCell('Draw Time')),
                    TableCell(child: _buildHeaderCell('Total Points')),
                    TableCell(child: _buildHeaderCell('Action')),
                  ],
                ),
                // Data Row
                if (tickets.isNotEmpty)
                  ...List.generate(tickets.length, (index) {
                    var ticket = tickets[index];
                    return TableRow(
                      decoration: BoxDecoration(color: Colors.white),
                      children: [
                        _buildDataCell((index + 1).toString()), // Serial Number
                        _buildDataCell(
                            ticket['ticketId'].toString()), // Ticket ID
                        _buildDataCell(
                            formatDate(ticket['drawDate'])), // Draw Date
                        _buildDataCell(ticket['drawTime']), // Draw Time
                        _buildDataCell(
                            ticket['betTotal'].toString()), // Bet Total
                        TableCell(
                          child: Container(
                            child: CustomButton(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.bold,
                              backgroundColor: Color(0xFFccc51c),
                              buttonText: "Cancel",
                              onPressed: () {
                                try {
                                  context.read<AuthCubit>().sendCancelTicket(
                                      ticket['ticketId'].toString());
                                  showSuccessDialog(context,
                                      "Ticket successfully cancelled and balance updated");
                                } catch (e) {
                                  print("error occured while canceling ticket");
                                }
                              },
                              btnwidth: screenWidth * 0.07,
                              btnheight: screenHeight * 0.05,
                              borderRadius: 0,
                            ),
                          ),
                        ),
                      ],
                    );
                  })
                else
                  TableRow(
                    decoration: BoxDecoration(
                      color: Colors.white, // Light blue color
                    ),
                    children: [
                      TableCell(child: _buildHeaderCell('')),
                      TableCell(child: _buildHeaderCell('')),
                      TableCell(child: _buildHeaderCell('')),
                      TableCell(child: _buildHeaderCell('')),
                      TableCell(child: _buildHeaderCell('')),
                      TableCell(child: _buildHeaderCell('')),
                    ],
                  ),
              ],
            ),
          ),
        );
      },
    );
  }

  // "Ticket successfully cancelled and balance updated"

  Widget _buildHeaderCell(String text) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildDataCell(String text) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Text(
        text,
        textAlign: TextAlign.center,
      ),
    );
  }
}


// class CancelMenuTable extends StatefulWidget {

//   CancelMenuTable({super.key});

//   @override
//   State<CancelMenuTable> createState() => _CancelMenuTableState();
// }

// class _CancelMenuTableState extends State<CancelMenuTable> {
//  final List<Map<String, dynamic>> data = [
//     {
//       'ticketId': 884240,
//       'drawTime': '02:12 PM',
//       'drawDate': '2025-01-28T18:30:00.000Z',
//       'betTotal': 20
//     },
//     {
//       'ticketId': 884241,
//       'drawTime': '02:15 PM',
//       'drawDate': '2025-01-29T18:30:00.000Z',
//       'betTotal': 15
//     },
//   ];

//   String formatDate(String dateStr) {
//     DateTime dateTime = DateTime.parse(dateStr);
//     return DateFormat("dd-MM-yyyy").format(dateTime);
//   }

 

//   @override
//   void initState() {
//     super.initState();
  
//   }

//   @override
//   Widget build(BuildContext context) {
//     print("printing ticket data in CancelMenuTable");
  
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;
//     return Container(
//       width: screenWidth * 0.6,
//       color: Colors.white,
//       child: SingleChildScrollView(
//         child: Table(
//           border: TableBorder.all(
//             color: Colors.grey,
//             width: 0.5,
//           ),
//           columnWidths: {
//             0: FlexColumnWidth(0.5), // Sr.No
//             1: FlexColumnWidth(1.2), // Ticket Id
//             2: FlexColumnWidth(1.2), // Draw Date
//             3: FlexColumnWidth(1.2), // Draw Time
//             4: FlexColumnWidth(1.0), // Total Points
//             5: FlexColumnWidth(0.8), // Action
//           },
//           children: [
//             // Header Row
//             TableRow(
//               decoration: BoxDecoration(
//                 color: Color(0xFF87ceea), // Light blue color
//               ),
//               children: [
//                 TableCell(child: _buildHeaderCell('Sr.No')),
//                 TableCell(child: _buildHeaderCell('Ticket Id')),
//                 TableCell(child: _buildHeaderCell('Draw Date')),
//                 TableCell(child: _buildHeaderCell('Draw Time')),
//                 TableCell(child: _buildHeaderCell('Total Points')),
//                 TableCell(child: _buildHeaderCell('Action')),
//               ],
//             ),
//             // Data Row
//             ...List.generate(data.length, (index) {
//               var item = data[index];
//               return TableRow(
//                 decoration: BoxDecoration(color: Colors.white),
//                 children: [
//                   // TableCell(child: _buildDataCell('30')),
//                   _buildDataCell((index + 1).toString()), // Serial Number
//                   _buildDataCell(item['ticketId'].toString()), // Ticket ID
//                   _buildDataCell(formatDate(item['drawDate'])), // Draw Date
//                   _buildDataCell(item['drawTime']), // Draw Time
//                   _buildDataCell(item['betTotal'].toString()), // Bet Total
//                   TableCell(
//                     child: Container(
//                       // padding: EdgeInsets.all(8),

//                       child: CustomButton(
//                           fontSize: 11.sp,
//                           fontWeight: FontWeight.bold,
//                           backgroundColor: Color(0xFFccc51c),
//                           buttonText: "Cancel",
//                           onPressed: () {
//                             print("print ticket on click ${item['ticketId']}");
//                             context
//                                 .read<AuthCubit>()
//                                 .sendCancelTicket(item['ticketId'].toString());
//                           },
//                           btnwidth: screenWidth * 0.07,
//                           btnheight: screenHeight * 0.05,
//                           borderRadius: 0),
//                     ),
//                   ),
//                 ],
//               );
//             })
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildHeaderCell(String text) {
//     return Container(
//       padding: EdgeInsets.all(8),
//       child: Text(
//         text,
//         style: TextStyle(
//           fontWeight: FontWeight.bold,
//         ),
//         textAlign: TextAlign.center,
//       ),
//     );
//   }

//   Widget _buildDataCell(String text) {
//     return Container(
//       padding: EdgeInsets.all(8),
//       child: Text(
//         text,
//         textAlign: TextAlign.center,
//       ),
//     );
//   }
// }

// ///////////////////
