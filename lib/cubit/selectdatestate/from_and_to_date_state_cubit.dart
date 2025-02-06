import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuber/cubit/selectdatestate/from_and_to_date_state_state.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class FromAndToDateStateCubit extends Cubit<FromAndToDateStateState> {
  final IO.Socket socket;

  FromAndToDateStateCubit({required this.socket})
      : super(FromAndToDateStateStateInitial());

  void initializeFromDate(fromDate) {
    emit(FromDateStateStateLoaded(fromDate));
  }

  void initializeToDate(toDate) {
    emit(ToDateStateStateLoaded(toDate));
  }
}
