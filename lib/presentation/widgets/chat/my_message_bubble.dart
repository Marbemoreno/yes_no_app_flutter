import 'package:flutter/material.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class MyMessageBubble extends StatelessWidget {
  final Message message;

  
  const MyMessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end, // alinear el texto a la derecha
      children: [
        Container(
          decoration: BoxDecoration(
            color: colors.primary,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              '${message.text}\n${message.createdAt.hour}:${message.createdAt.minute}',
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      const SizedBox(height: 10),  // es como el gap en css
      ],
    );
  }
}
