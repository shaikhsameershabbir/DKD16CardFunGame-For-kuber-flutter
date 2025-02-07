import 'package:socket_io_client/socket_io_client.dart' as IO;

IO.Socket createSocket(String token) {
  return IO.io(
    // "https://147.93.103.122:4000",
    "http://192.168.0.225:4000",
    IO.OptionBuilder()
        .setTransports(['websocket'])
        .enableAutoConnect()
        .setExtraHeaders({'Cookie': 'token=$token'})
        .setAuth({'token': token})
        .build(),
  );
}

// IO.Socket createSocket(String? _token) {
//   if (_token == null) {
//     return IO.io(
//       // "https://147.93.103.122:4000",
//       "http://192.168.0.225:4000",
//       IO.OptionBuilder().setTransports(['websocket']).build(),
//     );
//   }
//   return IO.io(
//     // "https://147.93.103.122:4000",
//     "http://192.168.0.225:4000",
//     IO.OptionBuilder()
//         .setTransports(['websocket'])
//         .enableAutoConnect()
//         .setExtraHeaders({'Cookie': 'token=$_token'})
//         .setAuth({'token': _token})
//         .build(),
//   );
// }

// void reconnectSocket(String _token) {
//   print("========================= Socket Reconnecting =====================");
//   IO.io(
//     "https://147.93.103.122:4000",
//     // "http://192.168.0.225:4000",
//     IO.OptionBuilder()
//         .setTransports(['websocket'])
//         .enableAutoConnect()
//         .setExtraHeaders({'Cookie': 'token=$_token'})
//         .setAuth({'token': _token})
//         .build(),
//   );
// }



















 // String? _token;

  // final prefs = await SharedPreferences.getInstance();
  // _token = prefs.getString('token');


  // return IO.io(
  //   // "https://147.93.103.122:4000",
  //   "http://192.168.0.225:4000",
  //   IO.OptionBuilder().setTransports(['websocket']).enableAutoConnect().build(),
  // );


//  return IO.io(
//     // "https://147.93.103.122:4000",
//     "http://192.168.0.225:4000",
//     IO.OptionBuilder()
//         .setTransports(['websocket'])
//         .enableAutoConnect()
//         .setExtraHeaders({'Cookie': 'token=$_token'}) // Send token as cookie
//         .setAuth({'token': _token}) // Also send in auth for redundancy
//         .build(),
//   );