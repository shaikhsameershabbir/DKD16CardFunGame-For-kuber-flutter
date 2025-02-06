import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuber/cubit/balance_update_cubit.dart/balance_update_cubit.dart';
import 'package:kuber/cubit/claimticket/claim_ticket_state.dart';
import 'package:kuber/screens/onclickmenupopup/barcodeclick_winning_popup.dart';
import 'package:kuber/widgets/show_dialog.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ClaimTicketCubit extends Cubit<ClaimTicketState> {
  final IO.Socket socket;
  final BalanceUpdateCubit balanceCubit;

  ClaimTicketCubit({required this.socket, required this.balanceCubit})
      : super(ClaimTicketInitial());

  void initializeClaimTicketSocket(
      context, ticket, screenWidth, screenHeight) async {
    String message = "";
    int winAmount;
    int betTotal;
    String drawTime;
    String drawDate;
    int winner;
    bool already;
    bool success;
    int xvalue;
    try {
      // socket.emit("claimTicket", ticket);
      if (RegExp(r'^\d{6}$').hasMatch(ticket)) {
        socket.emit("claimTicket", ticket);
      } else {
        print("Invalid ticket: Ticket must be a 6-digit number");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              "Invalid ticket: Ticket must be a 6-digit number",
              textAlign: TextAlign.center,
            ),
            duration: Duration(seconds: 2),
          ),
        );
      }
      // socket.emit("claimTicket", "680340");
      socket.off("claimTicketResponse");
      socket.on("claimTicketResponse", (response) {
        print("printing rsponse from claim ticket cubit");
        print(response);
        success = response["success"];
        already = response["already"];

        Map<String, dynamic> res = response;
        if (success == true && already == false) {
          message = response["data"]['message'];

          winAmount = response["data"]["winAmount"];

          betTotal = response["data"]["betTotal"];

          drawTime = response["data"]["drawTime"];
          drawDate = response["data"]["drawDate"];

          winner = response["data"]?["winner"];
          xvalue = response["data"]?["xValue"];

          // balanceCubit.initializeBalanceSocket();

          showPopup(
              context,
              ticket,
              screenWidth,
              screenHeight,
              winAmount,
              betTotal,
              drawTime,
              drawDate,
              winner,
              ticket,
              xvalue,
              balanceCubit);
        }
        if (success == false && already == true) {
          message = response["data"]["message"];
          int claimAmount = response["data"]["winAmount"];
          showSuccessDialog(context, message, "", claimAmount);
        }

        if (success == false && already == false) {
          message = response["message"];
          showSuccessDialog(context, message, "", 0);
        }

        // emit(ClaimTicketLoaded(response));
      });
    } catch (e) {
      // showSuccessDialog(context, message, "", 0);
    }
  }
}
