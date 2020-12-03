import 'package:architecture/network/ws_connection.dart';
import 'package:web_socket_channel/io.dart';

class WebSocketConnectionImpl<T> implements WebSocketConnection{
  final _channel = IOWebSocketChannel.connect('wss://connect.websocket'
      '.in/v3/1'
      '?api_key=oCdCMcMPQpbvNjUIzqtvF1d2X2okWpDQj4AwARJuAgtjhzKxVEjQU6IdCjwm'
      '&notify_self');

  @override
  void close() {
    _channel?.sink?.close();
  }

  @override
  void sendData(String data) {
    _channel?.sink?.add(data);
  }

  @override
  Stream<T> getStream() => _channel.stream;
}