import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuber/cubit/balance_update_cubit.dart/balance_update_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;

class BalanceUpdateCubit extends Cubit<BalanceUpdateState> {
  final IO.Socket socket;

  BalanceUpdateCubit({required this.socket}) : super(BalanceInitial());

  void initializeBalanceSocket() async {
    // print("printing token in initializeBalanceSocket====================");
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token != null) {
      // Update socket headers dynamically before making a request
      socket.io.options?['extraHeaders'] = {'Cookie': 'token=$token'};
      socket.io.options?['auth'] = {'token': token};
      // socket.disconnect();
      // socket.connect();
    }

    socket.emit("getBalance");

    socket.off("balanceResponse");
    socket.on("balanceResponse", (data) {
      emit(BalanceLoaded(data["balance"].toString()));
    });
  }
}
