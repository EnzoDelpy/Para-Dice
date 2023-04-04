import 'package:flutter/material.dart';
import 'package:para_dice/vue/myhomepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Para\'Dice',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const MyHomePage(title: 'Flutter Para\'Dice'),
      debugShowCheckedModeBanner: false,
    );
  }
}
