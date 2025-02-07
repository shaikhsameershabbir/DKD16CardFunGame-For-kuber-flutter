import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuber/cubit/cleardata/clear_data_state.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class ClearDataCubit extends Cubit<ClearDataState> {
  final IO.Socket socket;

  ClearDataCubit({required this.socket}) : super(ClearDataInitial());

  Future<void> initializeClearDataOnSocket() async {
    emit(ResetDataOnState());
  }

  Future<void> initializeClearDataOfSocket() async {
    emit(ResetDataOnState());
  }
}
