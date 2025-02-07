import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuber/cubit/dkdWinner/dkd_winner_state.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;

class DkdWinnerCubit extends Cubit<DkdWinnerState> {
  final IO.Socket socket;

  DkdWinnerCubit({required this.socket}) : super(DKDWinnerInitial());

  Future<void> initializeDKDWinnerSocket() async {
    // {winner: 1, xValue: 1}
    socket.off("dkdWinner");
    socket.on('dkdWinner', (dkdResponse) {
      String winner = dkdResponse['winner'].toString();
      String xValue = dkdResponse['xValue'].toString();
      emit(DKDWinnerUpdated(winner, xValue));
    });
    // socket.connect();
  }
}
