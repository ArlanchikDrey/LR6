import 'package:architecture/notifiers/WSConnectionNotifier.dart';
import 'package:architecture/repository/repository_impl.dart';
import 'package:flutter/material.dart';

class WSConnectionNotifierImpl extends ChangeNotifier implements WSConnectionNotifier{
  final _repository = RepositoryImpl();

  @override
  void sendData(String data) {
    if(data != null && data.isNotEmpty)
      _repository.sendData(data);
    else
      throw Exception(['data cannot be null or empty']);
  }

  @override
  void dispose() {
    _repository.close();
    super.dispose();
  }

  @override
  void close() {
    // TODO: instead we use dispose
  }

  @override
  Stream<dynamic> getStream() => _repository.getStream();
}