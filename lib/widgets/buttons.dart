import 'package:flutter/material.dart';

class BtnLight extends StatelessWidget {
  final String numero;
  const BtnLight({super.key, required this.numero});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        print("Click $numero");
      },
      child: Text(
        this.numero,
        style: TextStyle(fontSize: 24, color: const Color(0xFF333333)),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(const Color(0xFFFFF9C4)), 
      ),
    );
  }
}

class BtnDark extends StatelessWidget {
  final String numero;
  const BtnDark({super.key, required this.numero});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        print("Click $numero");
      },
      child: Text(
        this.numero,
        style: TextStyle(fontSize: 24, color: const Color(0xFFF5F5F5)),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(const Color(0xFF424242)),
      ),
    );
  }
}
