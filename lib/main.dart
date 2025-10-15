import 'package:flutter/material.dart';
import 'tabela_brasileirao.dart';
import 'artilheiro_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Brasileirão Tabela',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 255, 255, 255)),
        scaffoldBackgroundColor: Colors.white, 
      ),
      home: const MyHomePage(title: 'Brasileirão Tabela'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white, 
        title: Text('Brasileirão 2025', style: TextStyle(color: Colors.black)),
      ),
      body: const TabelaBrasileirao(),
    );
  }
}
