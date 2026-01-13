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
      title: 'Calculadora',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          elevation: 0,
        ),
      ),
      home: const CalculatorScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _display = '0'; // Display initial value
  final TextEditingController _ctrlDisplay = TextEditingController(text: "");
  double aux1 = 0;
  double aux2 = 0;
  String operacion = "";

  void setAux1(String sim) {
    operacion = sim;
    aux1 = double.parse(_ctrlDisplay.text);
    _ctrlDisplay.text = "";
  }

  void setAux2() {
    aux2 = double.parse(_ctrlDisplay.text);
    _ctrlDisplay.text = "";
  }

  void calcular() {
    double resultado = 0;
    if (operacion == "+") {
      resultado = aux1 + aux2;
    } else if (operacion == "-") {
      resultado = aux1 - aux2;
    } else if (operacion == "×"){
      resultado = aux1 * aux2;
    } else if(operacion == "÷"){
      resultado = aux1 / aux2;
    }
    _ctrlDisplay.text = "${resultado}";
    setState(() {
      _display = "${resultado}";
    });
  }

  void _onButtonPressed(String text) {
    // Si es un número o el operador de la calculadora
    if (text == "+" || text == "-" || text == "×" || text == "÷") {
      setAux1(text);
    }
    // Si es el botón "=" para realizar la operación
    else if (text == "=") {
      setAux2();
      calcular();
    }
    // Si es un número o el punto decimal, concatenamos el texto
    else if (text == "C") {
      _ctrlDisplay.text = "";
      setState(() {
        _display = '0';
      });
    } else {
      _ctrlDisplay.text = "${_ctrlDisplay.text}$text";
    }
    setState(() {
      _display = _ctrlDisplay.text; // Actualizamos el display
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Calculadora',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Pantalla de la calculadora
          Container(
            height: 150,
            color: Colors.black,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.bottomRight,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              reverse: true,
              child: Container(
                width: MediaQuery.of(
                  context,
                ).size.width, // Ancho dinámico según el tamaño de la pantalla
                child: TextField(
                  controller: _ctrlDisplay,
                  style: const TextStyle(
                    fontSize: 64,
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                  ),
                  textAlign: TextAlign.end,
                  readOnly: true, // Esto deshabilita el teclado físico
                  cursorColor: Colors.transparent, // Esto oculta el cursor
                  decoration: InputDecoration(
                    border: InputBorder
                        .none, // Evita que aparezca el borde del TextField
                  ),
                ),
              ),
            ),
          ),
          // Teclado de la calculadora
          Expanded(
            child: Container(
              color: Colors.black,
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  // Primera fila
                  Row(
                    children: [
                      CalculatorButton(
                        text: 'C',
                        onPressed: _onButtonPressed,
                        backgroundColor: const Color(0xFFF1F7ED),
                        textColor: Colors.black,
                        fontSize: 26,
                      ),
                      CalculatorButton(
                        text: '+/-',
                        onPressed: _onButtonPressed,
                        backgroundColor: const Color(0xFFF1F7ED),
                        textColor: Colors.black,
                        fontSize: 26,
                      ),
                      CalculatorButton(
                        text: '%',
                        onPressed: _onButtonPressed,
                        backgroundColor: const Color(0xFFF1F7ED),
                        textColor: Colors.black,
                        fontSize: 26,
                      ),
                      CalculatorButton(
                        text: '÷',
                        onPressed: _onButtonPressed,
                        backgroundColor: const Color(0xFFF2BB05),
                        textColor: Colors.white,
                        fontSize: 32,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  // Segunda fila
                  Row(
                    children: [
                      CalculatorButton(
                        text: '1/x',
                        onPressed: _onButtonPressed,
                        backgroundColor: const Color(0xFFF1F7ED),
                        textColor: Colors.black,
                        fontSize: 24,
                      ),
                      CalculatorButton(
                        text: 'x²',
                        onPressed: _onButtonPressed,
                        backgroundColor: const Color(0xFFF1F7ED),
                        textColor: Colors.black,
                        fontSize: 24,
                      ),
                      CalculatorButton(
                        text: '√',
                        onPressed: _onButtonPressed,
                        backgroundColor: const Color(0xFFF1F7ED),
                        textColor: Colors.black,
                        fontSize: 24,
                      ),
                      CalculatorButton(
                        text: '×',
                        onPressed: _onButtonPressed,
                        backgroundColor: const Color(0xFFF2BB05),
                        textColor: Colors.white,
                        fontSize: 32,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  // Tercera fila
                  Row(
                    children: [
                      CalculatorButton(
                        text: '7',
                        onPressed: _onButtonPressed,
                        backgroundColor: const Color(0xFF333333),
                        textColor: Colors.white,
                        fontSize: 28,
                      ),
                      CalculatorButton(
                        text: '8',
                        onPressed: _onButtonPressed,
                        backgroundColor: const Color(0xFF333333),
                        textColor: Colors.white,
                        fontSize: 28,
                      ),
                      CalculatorButton(
                        text: '9',
                        onPressed: _onButtonPressed,
                        backgroundColor: const Color(0xFF333333),
                        textColor: Colors.white,
                        fontSize: 28,
                      ),
                      CalculatorButton(
                        text: '-',
                        onPressed: _onButtonPressed,
                        backgroundColor: const Color(0xFFF2BB05),
                        textColor: Colors.white,
                        fontSize: 32,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  // Cuarta fila
                  Row(
                    children: [
                      CalculatorButton(
                        text: '4',
                        onPressed: _onButtonPressed,
                        backgroundColor: const Color(0xFF333333),
                        textColor: Colors.white,
                        fontSize: 28,
                      ),
                      CalculatorButton(
                        text: '5',
                        onPressed: _onButtonPressed,
                        backgroundColor: const Color(0xFF333333),
                        textColor: Colors.white,
                        fontSize: 28,
                      ),
                      CalculatorButton(
                        text: '6',
                        onPressed: _onButtonPressed,
                        backgroundColor: const Color(0xFF333333),
                        textColor: Colors.white,
                        fontSize: 28,
                      ),
                      CalculatorButton(
                        text: '+',
                        onPressed: _onButtonPressed,
                        backgroundColor: const Color(0xFFF2BB05),
                        textColor: Colors.white,
                        fontSize: 32,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  // Quinta fila
                  Row(
                    children: [
                      CalculatorButton(
                        text: '1',
                        onPressed: _onButtonPressed,
                        backgroundColor: const Color(0xFF333333),
                        textColor: Colors.white,
                        fontSize: 28,
                      ),
                      CalculatorButton(
                        text: '2',
                        onPressed: _onButtonPressed,
                        backgroundColor: const Color(0xFF333333),
                        textColor: Colors.white,
                        fontSize: 28,
                      ),
                      CalculatorButton(
                        text: '3',
                        onPressed: _onButtonPressed,
                        backgroundColor: const Color(0xFF333333),
                        textColor: Colors.white,
                        fontSize: 28,
                      ),
                      CalculatorButton(
                        text: '=',
                        onPressed: _onButtonPressed,
                        backgroundColor: const Color(0xFFF2BB05),
                        textColor: Colors.white,
                        fontSize: 32,
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  // Sexta fila
                  Row(
                    children: [
                      CalculatorButton(
                        text: '0',
                        onPressed: _onButtonPressed,
                        backgroundColor: const Color(0xFF333333),
                        textColor: Colors.white,
                        fontSize: 28,
                        isWide: true,
                      ),
                      CalculatorButton(
                        text: '.',
                        onPressed: _onButtonPressed,
                        backgroundColor: const Color(0xFF333333),
                        textColor: Colors.white,
                        fontSize: 32,
                      ),
                      CalculatorButton(
                        text: '⌫',
                        onPressed: _onButtonPressed,
                        backgroundColor: const Color(0xFFF1F7ED),
                        textColor: Colors.black,
                        fontSize: 26,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
