abstract class WebSocketConnection<T>{
  void sendData(String data);

  void close();

  T getStream();
}