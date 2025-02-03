import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuber/cubit/claimticket/claim_ticket_state.dart';
import 'package:kuber/screens/onclickmenupopup/barcodeclick_winning_popup.dart';
import 'package:kuber/widgets/show_dialog.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ClaimTicketCubit extends Cubit<ClaimTicketState> {
  final IO.Socket socket;

  ClaimTicketCubit({required this.socket}) : super(ClaimTicketInitial());

  void initializeClaimTicketSocket(
      context, ticket, screenWidth, screenHeight) async {
    String message = "";
    int winAmount;
    int betTotal;
    String drawTime;
    int winner;
    bool already;
    bool success;
    try {
      print("i am inside ClaimTicketCubit.............................");

      // socket.emit("claimTicket", ticket);
      if (RegExp(r'^\d{6}$').hasMatch(ticket)) {
        socket.emit("claimTicket", ticket);
      } else {
        print("Invalid ticket: Ticket must be a 6-digit number");
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

          drawTime = response["data"]["drawDate"];

          winner = response["data"]?["winner"];

          showPopup(context, ticket, screenWidth, screenHeight, winAmount,
              betTotal, drawTime, winner, ticket);
        }
        if (success == false && already == true) {
          message = response["data"]["message"];
          showSuccessDialog(context, message, "", 0);
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
