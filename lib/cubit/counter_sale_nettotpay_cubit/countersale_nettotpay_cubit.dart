import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuber/cubit/counter_sale_nettotpay_cubit/countersale_nettotpay_state.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class CountersaleNettotpayCubit extends Cubit<CountersaleNettotpayState> {
  final IO.Socket socket;

  CountersaleNettotpayCubit({required this.socket})
      : super(CountersaleNettotpayStateInitial());

  Future<void> initializeCounterSaleNettoPaySocket(fromdate, todate) async {
    var data = {"fromDate": fromdate, "toDate": todate, "gameId": 1};

    socket.emit("getUserAccountForGame", data);

    socket.on('getAddcountDataAllResponse', (response) {
      // print("-------------------hellov and todate -------------------------");
      emit(CountersaleNettotpayStateUpdated(response));
    });
  }
}
