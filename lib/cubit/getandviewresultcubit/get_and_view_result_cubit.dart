import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuber/cubit/getandviewresultcubit/get_and_view_result_state.dart';

import 'package:socket_io_client/socket_io_client.dart' as IO;

class GetAndViewResultCubit extends Cubit<GetAndViewResultState> {
  final IO.Socket socket;

  GetAndViewResultCubit({required this.socket}) : super(ResultLoadedInitial());

  Future<void> initializeGetResultsSocket(date) async {
    var sendData = {"drawDate": date, "gameId": 1};
    socket.emit("gateDateResult", sendData);

    socket.on('gateDateResultResponse', (results) {
      List<Map<String, dynamic>> checkLength =
          List<Map<String, dynamic>>.from(results);

      List<Map<String, dynamic>> res = List<Map<String, dynamic>>.from(results);
      emit(ResultLoaded(res));
    });
  }
}
