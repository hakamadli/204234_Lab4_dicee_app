import 'dart:math';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Dice Roller - 204234',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              fontFamily: 'Lobster-Regular',
              color: Colors.greenAccent,
            ),
          ),
          backgroundColor: Colors.purple[900],
          centerTitle: true,
        ),
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
                fit: BoxFit.fill,
              ),
          ),
          child: Dice(),
        ),
      ),
    ),
  );
}

class Dice extends StatefulWidget {
  @override
  _DiceState createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  int totalDiceNumber = 2;
  final player = AudioCache();

  void rollDice() {
    setState(() {
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
      totalDiceNumber = leftDiceNumber + rightDiceNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.center,
        //mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 36, bottom: 56),
            child: Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                'assets/images/diceeLogo.png',
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Image.asset(
                  'assets/images/dice$leftDiceNumber.png',
                  height: 120,
                  width: 120,
                ),
              ),
              //Get students to create the second die as a challenge
              Expanded(
                child: Image.asset(
                  'assets/images/dice$rightDiceNumber.png',
                  height: 120,
                  width: 120,
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 56),
            child: Text(
              'Sum: $totalDiceNumber',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  fontFamily: 'Lobster-Regular',
                  color: Colors.white,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 36),
            child: RaisedButton(
              color: Colors.purple[900],
              onPressed: () {
                rollDice();
                player.play('audio/diceRoll.mp3');
              },
              child: Text(
                'Roll Dice',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    fontFamily: 'Lobster-Regular',
                    color: Colors.greenAccent,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
