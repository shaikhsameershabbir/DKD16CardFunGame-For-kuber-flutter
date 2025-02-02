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
    try {
      print("i am inside ClaimTicketCubit.............................");

      socket.emit("claimTicket", ticket);
      // socket.emit("claimTicket", "680340");
      socket.off("claimTicketResponse");
      socket.on("claimTicketResponse", (response) {
        // bool success = response["success"];
        // String message = response==Map<String, dynamic>? response["data"]["message"] ?? response["message"];

        try {
          message =
              (response["data"] is Map<String, dynamic>) ?? response["data"]
                  ? ["message"]
                  : response["message"];
        } catch (e) {
          message = response["data"]['message'];
          // showSuccessDialog(context, message, "", 0);
        }
        // int winAmount = (response["data"] is Map<String, dynamic>)??  response["data"]["winAmount"] : 0;
        // int betTotal = (response["data"] is Map<String, dynamic>)??? response["data"]["betTotal"] ?? 0;
        // String drawTime =(response["data"] is Map<String, dynamic>)?? response["data"]["drawDate"] ?? ""; // Keep as String
        // int winner = response["data"]["winner"] ?? 0; // Ensure it's an int

        int winAmount = (response["data"] is Map<String, dynamic>)
            ? response["data"]["winAmount"] ?? 0
            : 0;

        int betTotal = (response["data"] is Map<String, dynamic>)
            ? response["data"]["betTotal"] ?? 0
            : 0;

        String drawTime = (response["data"] is Map<String, dynamic>)
            ? response["data"]["drawDate"] ?? ""
            : "";

        // int winner = response["data"]["winner"] ?? 0; // Ensure it's an int

        // bool already = response["already"];
        int winner = response["data"]?["winner"] ?? 0; // Ensure it's an int

        bool already = response["already"] ?? false; // Ensure it's a bool

        print("already claimed=------------------------------");

        print(already);
        print("already claimed=------------------------------");

        try {
          showSuccessDialog(context, message, "", 0);
        } catch (e) {
          print("Error occured");
        }
        if (already == false && (response["data"] is Map<String, dynamic>)) {
          print("already claimed=------------------------------");
          showPopup(context, ticket, screenWidth, screenHeight, winAmount,
              betTotal, drawTime, winner, ticket);
          print("object");
        }

        // emit(ClaimTicketLoaded(response));
      });
    } catch (e) {
      showSuccessDialog(context, message, "", 0);
    }
  }
}
// claim ticket response {success: false, data:
// {message: Congratulations, winAmount: 110, drawTime: 03:18 PM, winner: 1}}
