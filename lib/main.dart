import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_not_app/config/theme/app_theme.dart';
import 'package:yes_not_app/config/screens/chat/chat_screen.dart';
import 'package:yes_not_app/presentation/providers/chat_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ChatProvider())],
      child: MaterialApp(
          title: 'Yes Not App',
          debugShowCheckedModeBanner: false,
          theme: AppTheme(selectedColor: 2).theme(),
          home: const ChatScreen()),
    );
  }
}
