import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuber/cubit/balance_update_cubit.dart/balance_update_cubit.dart';
import 'package:kuber/main.dart';
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
      socket.onConnect((_) {
        emit(AuthSocketConnected());
      });

      socket.onDisconnect((_) {
        emit(AuthSocketDisconnected());
      });

      // socket.on('loginResponse', (data) {
      //   print("loginResponse - $data");

      //   if (data['success']) {
      //     emit(AuthLoginSuccess(data));
      //   } else {
      //     emit(AuthLoginFailure(data['message']));
      //   }
      // });

      // socket.on("setCookie", (cookie) async {
      //   print("Received cookie: $cookie");

      //   if (cookie['name'] == 'token' && cookie['value'] != null) {
      //     String newToken = cookie['value'];
      //     await _updateToken(newToken);
      //   }
      // });

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

      socket.on('loginResponse', (data) async {
        print("Login response - $data");

        if (data['success']) {
          if (data['name'] == 'token' && data['value'] != null) {
            String newToken = data['value'];
            int userId = data["userId"];
            socket.auth = {
              'token': newToken
            }; // Update the authentication token
            var prewSocket = socket.id;
            socket.disconnect(); // Disconnect the socket

            socket.once('connect', (_) {
              var newSocket = socket.id;
              socket.emit(
                  'socketChanged', {'userId': userId, 'newSocket': newSocket});
            });
            await socket.connect(); // Reconnect with the updated token

            await _updateToken(newToken);
          }
          // await _updateToken(newToken);
          emit(AuthLoginSuccess(data));
        } else {
          emit(AuthLoginFailure(data['message']));
        }
      });

      // socket.on("setCookie", (cookie) async {
      //   final prefs = await SharedPreferences.getInstance();

      // });

      socket.on("error", (error) {
        emit(AuthLoginFailure("Error during login: ${error.toString()}"));
      });
    } catch (e) {
      emit(AuthLoginFailure("Login failed: ${e.toString()}"));
    }
  }

  void emitConfirmBet(Map<String, dynamic> data) {
    socket.emit("confirmBet", data);

    // Remove previous event listeners to prevent multiple handlers
    socket.off("betConfirmed");

    socket.on("betConfirmed", (confirmBetResponse) async {
      if (confirmBetResponse != null) {
        balanceCubit.initializeBalanceSocket();
        await AcccountMainPageBetPrint.mainPageBetPrintReceipt(
            confirmBetResponse);
      } else {}
    });
  }

  // Future<void> _updateToken(String newToken) async {
  //   _token = newToken;
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('token', newToken);

  //   // Update socket connection with new token
  //   socket.io.options?['extraHeaders'] = {'Authorization': 'Bearer $_token'};
  //   socket.io.options?['auth'] = {'token': _token};

  //   // Reconnect socket to apply new token
  //   // socket.disconnect();
  //   socket.connect();
  // }

  // Future<void> _clearToken() async {
  //   _token = null;
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.remove('token');

  //   // Clear token from socket connection
  //   socket.io.options?['extraHeaders'] = {};
  //   socket.io.options?['auth'] = {};
  // }

///////////////// my code ///////////////
  // Update token in both memory and persistent storage
  Future<void> _updateToken(String newToken) async {
    _token = newToken;
    final prefs = await SharedPreferences.getInstance();
    try {
      await prefs.clear();
    } catch (e) {}
    await prefs.setString('token', newToken);

    socket.io.options?['extraHeaders'] = {'Cookie': 'token=$_token'};
    socket.io.options?['auth'] = {'token': _token};
  }
  // // // Optionally, if you're using the token in headers for socket events:
  // // socket.io.options?['extraHeaders'] = {'Cookie': 'token=$_token'};
  // // socket.io.options?['auth'] = {'token': _token};

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
    socket.off("cancelTicketResponse");
    socket.on("cancelTicketResponse", (cancelTicketResponse) {
      if (cancelTicketResponse["success"] == true) {
        balanceCubit.initializeBalanceSocket();
      }
    });
  }

  // reprint show 10 records
  void getLast10Bets(context, width, height) {
    socket.emit("last10Bets", 1); // game id

    socket.off("last10BetsResponce");
    socket.on("last10BetsResponce", (last10Bets) {
      List<Map<String, dynamic>> data =
          List<Map<String, dynamic>>.from(last10Bets);
      reprintDialog(context, width, height, data);
    });
    // reprintDialog(context, width, height, data);
  }

  void getSingleTicketDataFromLast10Bets(String ticket) {
    socket.emit("getTicketData", ticket);
    socket.off("getTicketDataResponse");
    socket.on("getTicketDataResponse", (singleTicketData) async {
      if (singleTicketData != null) {
        await ReprintSingleTicket.printSingleTicketReceipt(singleTicketData);
      } else {}
    });
  }

  void logout() async {
    try {
      socket.emit("userLogout");
      final prefs = await SharedPreferences.getInstance();
      prefs.clear();
      emit(AuthLoggedOut());
    } catch (e) {
      emit(AuthSocketError("Logout failed: ${e.toString()}"));
    }
  }
}
