// ignore_for_file: prefer_const_constructors

import 'dart:math';
import 'package:flutter/material.dart';

class GamePage extends StatefulWidget {
  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final TextEditingController _controller = TextEditingController();
  late int _randomNumber; 
  String _feedback = '';

  @override
  void initState() {
    super.initState();
    _resetGame();  
  }

  void _checkGuess() {
    int? guess = int.tryParse(_controller.text); 
    if (guess == null) {
      setState(() {
        _feedback = 'insira um número válido.';
      });
    } else if (guess < _randomNumber) {
      setState(() {
        _feedback = 'menor que o número sorteado.';
      });
    } else if (guess > _randomNumber) {
      setState(() {
        _feedback = ' maior que o número sorteado.';
      });
    } else {
      setState(() {
        _feedback = 'você acertou!';
      });
    
      _resetGame();
    }
    _controller.clear();  
  }

  void _resetGame() {
    _randomNumber = Random().nextInt(60) + 1; 
    _feedback = '';  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adivinhe o Número'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Tente adivinhar o número entre 1 e 60:',
              style: TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Seu palpite',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _checkGuess,
              child: Text('Enviar Palpite'),
            ),
            SizedBox(height: 20),
            Text(
              _feedback,
              style: TextStyle(fontSize: 20, color: Colors.red),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
