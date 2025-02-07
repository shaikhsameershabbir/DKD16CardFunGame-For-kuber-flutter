import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuber/cubit/cleardata/clear_data_cubit.dart';
import 'package:kuber/cubit/drawtimecubit/draw_time_cubit.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;
part 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  final IO.Socket socket;
  final DrawTimeCubit drawTime;
  // final ClearDataCubit clearDataCubit;

  TimerCubit({required this.socket, required this.drawTime})
      : super(TimerInitial());

  Future<void> initializeTimerSocket() async {
    print("i am inside TimerCubit.............................");

    // Example of handling a specific event
    socket.on('dkdTimer', (sec) {
      // drawTime.initializeDrawTimeSocket();

      // if (int.parse(sec.toString()) < 10) {
      //   clearDataCubit.initializeClearDataOnSocket();
      // } else {
      //   clearDataCubit.initializeClearDataOfSocket();
      // }

      print("$sec");
      emit(TimerUpdated(sec));
    });
    socket.connect();
  }
}
