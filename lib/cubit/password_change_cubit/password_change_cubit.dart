import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kuber/cubit/password_change_cubit/password_change_state.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class PasswordChangeCubit extends Cubit<PasswordChangeState> {
  final IO.Socket socket;

  PasswordChangeCubit({required this.socket}) : super(PasswordChangeInitial());

  void initializePasswordChangeSocket(currentPass, newPass) {
    var data = {
      "currentPassword": currentPass.toString().trim(),
      "newPassword": newPass.toString().trim()
    };

    emit(PasswordChangeInitial());
    socket.emit("changePassword", data);

    socket.on("changePasswordResponse", (changePassResponse) {
      if (changePassResponse['success'] == true) {
        emit(PasswordChangedState(changePassResponse["message"]));
      } else {
        emit(PasswordChangedStateError(changePassResponse["message"]));
      }
    });
    // socket.connect();
  }
}
