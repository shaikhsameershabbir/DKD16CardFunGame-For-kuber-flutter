import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuber/cubit/counter_sale_nettotpay_cubit/countersale_nettotpay_state.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class CountersaleNettotpayCubit extends Cubit<CountersaleNettotpayState> {
  final IO.Socket socket;

  CountersaleNettotpayCubit({required this.socket})
      : super(CountersaleNettotpayStateInitial());

  Future<void> initializeCounterSaleNettoPaySocket(fromdate, todate) async {
    try {
      var data = {
        "fromDate": fromdate.toString(),
        "toDate": todate.toString(),
        "gameId": 1
      };
      print("-------------------hellov and todate -------------------------");

      print(data);

      socket.emit("getUserAccountForGame", data);

      socket.on('getAddcountDataAllResponse', (response) {
        print(response);
        emit(CountersaleNettotpayStateUpdated(response));
      });
    } catch (e) {
      print("error in CountersaleNettotpayCubit");
    }
  }
}
