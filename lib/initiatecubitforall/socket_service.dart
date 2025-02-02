import 'package:shared_preferences/shared_preferences.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  late IO.Socket socket;
  String? _token;

  Future<void> initializeSocket(String serverUrl) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      _token = prefs.getString('token');

      socket = IO.io(
        serverUrl,
        IO.OptionBuilder()
            .setTransports(['websocket'])
            .enableAutoConnect()
            .setExtraHeaders({'Cookie': 'token=$_token'})
            .setAuth({'token': _token})
            .build(),
      );

      socket.onConnect((_) => print("Socket Connected"));
      socket.onDisconnect((_) => print("Socket Disconnected"));
      socket.connect();
    } catch (e) {
      print("Socket initialization failed: ${e.toString()}");
    }
  }

  // Expose socket to AuthCubit or other classes
  IO.Socket get socketInstance => socket;
}
