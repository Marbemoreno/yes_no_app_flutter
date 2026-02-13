import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';

import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            // child: Text('M'),
            backgroundImage: NetworkImage(
              'https://img.freepik.com/free-photo/handsome-confident-smiling-male-with-hands-crossed-chest_176420-18743.jpg',
            ),
          ),
        ), // Icon(Icons.ac_unit),
        title: Text('Juan el mecánico 🤪'),
        centerTitle: true,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: chatProvider.messagesList.length,

                itemBuilder: (context, index) {
                  final message = chatProvider.messagesList[index];

                  return message.fromWho == FromWho.me
                      ? MyMessageBubble(message: message)
                      : HerMessageBubble();
                },
              ),
            ),
            // Caja de texto
            MessageFieldBox(
              onValue: (value) {
                chatProvider.sendMessage(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
