import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;
part 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  final IO.Socket socket;

  TimerCubit({required this.socket}) : super(TimerInitial());

  Future<void> initializeTimerSocket() async {
    print("i am inside TimerCubit.............................");

    // Example of handling a specific event
    socket.on('dkdTimer', (sec) {
      print("$sec");
      emit(TimerUpdated(sec));
    });
    socket.connect();
  }
}
