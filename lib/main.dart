// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        appBar: AppBar(
          title: Text(
            'Dicee',
          ),
          centerTitle: true,
          backgroundColor: Colors.teal,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNo = 2;
  int rightDiceNo = 5;
  int scoreA = 0;
  int scoreB = 0;
  int countScore = 1;

  void diceFaceChange() {
    scoreCounter();
    leftDiceNo = Random().nextInt(6) + 1;
    rightDiceNo = Random().nextInt(6) + 1;
    scoreA = scoreA + leftDiceNo;
    scoreB = scoreB + rightDiceNo;
  }

  void scoreCounter() {
    countScore = countScore + 1;
    if (countScore > 20) {
      scoreA = 0;
      scoreB = 0;
      countScore = 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Player1',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Player2',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              '$scoreA',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '$scoreB',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 50,
        ),
        Text(
          '$countScore / 20',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 80,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      diceFaceChange();
                    });
                  },
                  child: Image.asset('images/dice$leftDiceNo.png'),
                ),
              ),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      diceFaceChange();
                    });
                  },
                  child: Image.asset('images/dice$rightDiceNo.png'),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
