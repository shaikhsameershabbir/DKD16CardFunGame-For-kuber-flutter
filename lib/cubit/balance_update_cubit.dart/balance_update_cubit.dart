import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuber/cubit/balance_update_cubit.dart/balance_update_state.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;

class BalanceUpdateCubit extends Cubit<BalanceUpdateState> {
  final IO.Socket socket;

  BalanceUpdateCubit({required this.socket}) : super(BalanceInitial());

  void initializeBalanceSocket() {
    socket.emit("getBalance");

    socket.off("balanceResponse");
    socket.on("balanceResponse", (data) {
      // print("Balance updated: $data");
      emit(BalanceLoaded(data["balance"].toString()));
    });
  }
}
