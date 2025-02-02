import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuber/cubit/balance_update_cubit.dart/balance_update_cubit.dart';
import 'package:kuber/print_receipt_code/acccount_main_page_bet_print.dart';
import 'package:kuber/print_receipt_code/reprint_single_ticket.dart';
import 'package:kuber/screens/onclickmenupopup/reprint.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

part 'auth_state.dart';

// late IO.Socket socket;

class AuthCubit extends Cubit<AuthState> {
  String? _token;
  final IO.Socket socket;
  final BalanceUpdateCubit balanceCubit;
  AuthCubit({required this.socket, required this.balanceCubit})
      : super(AuthInitial());
  // Initialize socket and include cookie in headers
  Future<void> initializeSocket() async {
    try {
      print("i am inside AuthCubit");

      socket.onConnect((_) {
        print("Connected");
        emit(AuthSocketConnected());
      });

      socket.onDisconnect((_) {
        print("Disconnected");
        emit(AuthSocketDisconnected());
      });

      socket.on('loginResponse', (data) {
        print("loginResponse - $data");

        if (data['success']) {
          emit(AuthLoginSuccess(data));
        } else {
          emit(AuthLoginFailure(data['message']));
        }
      });

      socket.on("setCookie", (cookie) async {
        print("Received cookie: $cookie");

        if (cookie['name'] == 'token' && cookie['value'] != null) {
          String newToken = cookie['value'];
          await _updateToken(newToken);
        }
      });

      socket.connect();
    } catch (e) {
      emit(AuthSocketError("Socket initialization failed: ${e.toString()}"));
    }
  }

  // Login method
  void login(String username, String password, String systemId) {
    emit(AuthLoading());
    try {
      final Map<String, dynamic> loginData = {
        'username': username,
        'password': password,
        'systemId': systemId,
      };

      socket.emit('userLogin', loginData);

      // socket.on("error", (error) {
      //   emit(AuthLoginFailure("Error during login: ${error.toString()}"));
      // });
    } catch (e) {
      emit(AuthLoginFailure("Login failed: ${e.toString()}"));
    }
  }

  void emitConfirmBet(Map<String, dynamic> data) {
    socket.emit("confirmBet", data);

    // Remove previous event listeners to prevent multiple handlers
    socket.off("betConfirmed");

    socket.on("betConfirmed", (confirmBetResponse) async {
      print("place bet response - $confirmBetResponse");
      if (confirmBetResponse != null) {
        balanceCubit.initializeBalanceSocket();
        await AcccountMainPageBetPrint.mainPageBetPrintReceipt(
            confirmBetResponse);
      } else {
        print("betConfirmResponse null");
      }
    });
  }

  // Update token in both memory and persistent storage
  Future<void> _updateToken(String newToken) async {
    _token = newToken;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', newToken);

    // Optionally, if you're using the token in headers for socket events:
    socket.io.options?['extraHeaders'] = {'Cookie': 'token=$_token'};
    socket.io.options?['auth'] = {'token': _token};
  }

  // //getBalance //getResponse
  // void listenForBalanceUpdates() {
  //   socket.emit("getBalance");

  //   socket.on("balanceResponse", (data) {
  //     // print("Balance updated: $data");
  //     emit(AuthBalanceUpdated(data["balance"].toString()));
  //     socket.off("balanceResponse");
  //   });
  //   socket.off("balanceResponse");
  // }

  void getCurrentDrawTickets() {
    socket.emit("getAllTickets");

    socket.on("getAllTicketsResponse", (ticketsData) {
      List<Map<String, dynamic>> formattedTickets =
          List<Map<String, dynamic>>.from(ticketsData);

      emit(AuthCurrentDrawTicketsLoaded(formattedTickets));
    });
  }

  void sendCancelTicket(String ticketId) {
    socket.emit("cancelTicket", ticketId);
    socket.on("cancelTicketResponse", (cancelTicketResponse) {
      print("printing cancel Ticket Response");
      print(cancelTicketResponse);
      if (cancelTicketResponse["success"] == true) {
        balanceCubit.initializeBalanceSocket();
      }
    });
  }

  // reprint show 10 records
  void getLast10Bets(context, width, height) {
    print("print last 10 bets");
    socket.emit("last10Bets", 1); // game id

    socket.off("last10BetsResponce");
    socket.on("last10BetsResponce", (last10Bets) {
      print("last 10 bets response");
      print(last10Bets);
      List<Map<String, dynamic>> data =
          List<Map<String, dynamic>>.from(last10Bets);
      reprintDialog(context, width, height, data);
    });
    // reprintDialog(context, width, height, data);
  }

  void getSingleTicketDataFromLast10Bets(String ticket) {
    // print("single ticket: $ticket");
    socket.emit("getTicketData", ticket);
    socket.off("getTicketDataResponse");
    socket.on("getTicketDataResponse", (singleTicketData) async {
      // print(
      // print(singleTicketData);
      if (singleTicketData != null) {
        await ReprintSingleTicket.printSingleTicketReceipt(singleTicketData);
      } else {}
    });
  }

  // Logout method
  void logout() {
    try {
      socket.disconnect();
      emit(AuthLoggedOut());
    } catch (e) {
      emit(AuthSocketError("Logout failed: ${e.toString()}"));
    }
  }
}
