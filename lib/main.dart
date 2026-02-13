// escribir mateapp para por default tener un scaffold con un appbar y un body center con un container con un text button
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:yes_no_app/config/theme/app_theme.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/screens/chat/chat_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ChatProvider()), // chat provider envuelve a todo, chada widget que lo necesite puede usarlo hijo de este provider
      ],
      child: MaterialApp(
        title: 'Yes or No App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme(selectedColor: 0).theme(),
        home: const ChatScreen(),
      ),
    );
  }
}
