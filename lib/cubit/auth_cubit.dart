import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuber/print_receipt_code/acccount_main_page_bet_print.dart';
import 'package:kuber/print_receipt_code/reprint_single_ticket.dart';
import 'package:kuber/screens/onclickmenupopup/reprint.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

part 'auth_state.dart';

// // class AuthCubit extends Cubit<AuthState> {
// //   late IO.Socket socket;

// //   AuthCubit() : super(AuthInitial());

// //   // Accept socket directly
// //   void initializeSocket(IO.Socket socket) {
// //     this.socket = socket;

// //     socket.onConnect((_) {
// //       emit(AuthSocketConnected());
// //     });

// //     socket.onDisconnect((_) {
// //       emit(AuthSocketDisconnected());
// //     });

// //     socket.on('timer', (sec) {
// //       print(sec);
// //     });

// //     socket.on('loginResponse', (data) {
// //       print("loginResponse - $data");

// //       if (data['success']) {
// //         emit(AuthLoginSuccess(data));
// //       } else {
// //         emit(AuthLoginFailure(data['message']));
// //       }
// //     });

// //     socket.on("setCookie", (cookie) {
// //       print("cookie printing...");
// //       print(cookie);
// //     });

// //     socket.connect();
// //   }

// //   void login(String username, String password, String systemId) {
// //     emit(AuthLoading());
// //     try {
// //       final Map<String, dynamic> loginData = {
// //         'username': username,
// //         'password': password,
// //         'systemId': systemId,
// //       };
// //       socket.emit('userLogin', loginData);
// //     } catch (e) {
// //       emit(AuthLoginFailure(e.toString()));
// //     }
// //   }

// //   void logout() {
// //     try {
// //       socket.disconnect();
// //       emit(AuthLoggedOut());
// //     } catch (e) {
// //       emit(AuthSocketError(e.toString()));
// //     }
// //   }
// // }

late IO.Socket socket;

class AuthCubit extends Cubit<AuthState> {
  String? _token;

  AuthCubit() : super(AuthInitial());

  // Initialize socket and include cookie in headers
  Future<void> initializeSocket(String serverUrl) async {
    try {
      // Retrieve token from SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      _token = prefs.getString('token');

      socket = IO.io(
        serverUrl,
        IO.OptionBuilder()
            .setTransports(['websocket'])
            .disableAutoConnect()
            .enableAutoConnect()
            .setExtraHeaders(
                {'Cookie': 'token=$_token'}) // Send token as cookie
            .setAuth({'token': _token}) // Also send in auth for redundancy
            .build(),
      );

      // Set up connection handlers
      socket.onConnect((_) {
        print("Connected");
        emit(AuthSocketConnected());

        // Start listening for balance updates after connection
      });

      socket.onDisconnect((_) {
        print("Disconnected");

        emit(AuthSocketDisconnected());
      });

      socket.on('dkdTimer', (sec) {
        print(sec);
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

        // Check if the cookie name is 'token' and if the value is not null
        if (cookie['name'] == 'token' && cookie['value'] != null) {
          // Extract the token from the cookie
          String newToken = cookie['value'];

          // Update token in both memory and SharedPreferences
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
        listenForBalanceUpdates();
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

  //getBalance //getResponse
  void listenForBalanceUpdates() {
    socket.emit("getBalance");

    socket.off("balanceResponse");

    socket.on("balanceResponse", (data) {
      // print("Balance updated: $data");
      emit(AuthBalanceUpdated(data["balance"].toString()));
    });
  }

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
        listenForBalanceUpdates();
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
    print("single ticket: $ticket");
    socket.emit("getTicketData", ticket);
    socket.off("getTicketDataResponse");
    socket.on("getTicketDataResponse", (singleTicketData) async {
      print(
          "getting data from single ticket -----------------------------------------------------j");
      print(singleTicketData);
      if (singleTicketData != null) {
        await ReprintSingleTicket.printSingleTicketReceipt(singleTicketData);
      } else {
        print(
            "getting data from single ticket --- null--------------------------------------------------j");
      }
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
