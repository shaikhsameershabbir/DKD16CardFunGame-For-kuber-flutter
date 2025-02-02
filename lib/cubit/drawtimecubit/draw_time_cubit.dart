import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuber/cubit/drawtimecubit/draw_time_state.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;

class DrawTimeCubit extends Cubit<DrawTimeState> {
  final IO.Socket socket;

  DrawTimeCubit({required this.socket}) : super(DrawTimeInitial());

  void initializeDrawTimeSocket() {
    print("get draw Time hitted");
    socket.emit("getDrawTime", 1);

    socket.on("getDrawTimeResponse", (drawtime) {
      print("draw Time updated: $drawtime");
      emit(DrawTimeLoaded(
          drawtime["drawTime"].toString(), drawtime["drawDate"].toString()));
    });
    // socket.connect();
  }
}
