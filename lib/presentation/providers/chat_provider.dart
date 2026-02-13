import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> messagesList = [
    Message(text: 'Hola', fromWho: FromWho.me, createdAt: DateTime.now()),
    Message(text: 'Hola', fromWho: FromWho.her, createdAt: DateTime.now()),
    Message(text: 'Ya regresaste de trabajar?', fromWho: FromWho.me, createdAt: DateTime.now()),
    Message(text: 'Si, me voy a la casa', fromWho: FromWho.her, createdAt: DateTime.now()),
    Message(text: 'Que bueno, te voy a esperar', fromWho: FromWho.me, createdAt: DateTime.now()),
    Message(text: 'No te preocupes, te espero', fromWho: FromWho.her, createdAt: DateTime.now()),
    Message(text: 'Que bueno, te voy a esperar', fromWho: FromWho.me, createdAt: DateTime.now()),
  ];

  Future<void> sendMessage(String text) async {
    messagesList.add(Message(text: text, fromWho: FromWho.me, createdAt: DateTime.now()));
    notifyListeners();
  }
  void onMessageReceived(String text) {
    messagesList.add(Message(text: text, fromWho: FromWho.her, createdAt: DateTime.now()));
  }
  void clearMessages() {
    messagesList.clear();
  }

}