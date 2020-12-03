import 'package:architecture/network/ws_connection_impl.dart';
import 'package:architecture/repository/repository.dart';

class RepositoryImpl implements Repository {
  final _ebSocketConnectionImpl = WebSocketConnectionImpl<dynamic>();

  void close() {
    _ebSocketConnectionImpl.close();
  }

  void sendData(String data) {
    _ebSocketConnectionImpl.sendData(data);
  }

  Stream<dynamic> getStream() => _ebSocketConnectionImpl.getStream();
}