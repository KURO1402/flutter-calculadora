import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/buttons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yauri Calculadora',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'Calculadora'),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            Text("1"),
            Text("2"),
            Row(
              children: [
                BtnDark(numero: "^"),
                BtnDark(numero: "√"),
                BtnDark(numero: "⌫"),
                BtnDark(numero: "/"),
              ],
            ),
            Row(
              children: [
                BtnLight(numero: "7"),
                BtnLight(numero: "8"),
                BtnLight(numero: "9"),
                BtnDark(numero: "x"),
              ],
            ),
            Row(
              children: [
                BtnLight(numero: "4"),
                BtnLight(numero: "5"),
                BtnLight(numero: "6"),
                BtnDark(numero: "-"),
              ],
            ),
            Row(
              children: [
                BtnLight(numero: "1"),
                BtnLight(numero: "2"),
                BtnLight(numero: "3"),
                BtnDark(numero: "+"),
              ],
            ),
            Row(
              children: [
                BtnDark(numero: "+/-"),
                BtnLight(numero: "0"),
                BtnDark(numero: "."),
                BtnDark(numero: "="),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
