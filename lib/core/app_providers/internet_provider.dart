import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

final internetProvider = StateNotifierProvider<InternetNotifier, bool>((ref) {
  return InternetNotifier();
});

class InternetNotifier extends StateNotifier<bool> {
  InternetNotifier() : super(true) {
    checkInternetStatus();
    _listenInternetStatus();
  }

  final connection = InternetConnection.createInstance(
      checkInterval: const Duration(seconds: 10),
      // nếu muốn kiểm tra customCheckOptions thì set => useDefaultOptions: false
      // customCheckOptions: [
      //   // InternetCheckOption(uri: Uri.parse('https://google.com/')),
      //   // InternetCheckOption(uri: Uri.parse('https://pokeapi.co/api/v2/pokemon/1')),
      //   // InternetCheckOption(uri: Uri.parse('https://reqres.in/api/users/1')),
      // ],
      useDefaultOptions: true);

  checkInternetStatus() async {
    state = await connection.hasInternetAccess;
  }

  _listenInternetStatus() {
    connection.onStatusChange.listen(
      (InternetStatus status) {
        bool isConnected = state;
        switch (status) {
          case InternetStatus.connected:
            isConnected = true;
            break;
          case InternetStatus.disconnected:
            isConnected = false;
            break;
        }
        if (isConnected != state) {
          state = isConnected;
        }
      },
    );
  }
}
