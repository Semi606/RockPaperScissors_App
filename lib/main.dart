import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: RockPaperScissors(),
  ));
}

class RockPaperScissors extends StatefulWidget {
  @override
  _RockPaperScissorsState createState() => _RockPaperScissorsState();
}

class _RockPaperScissorsState extends State<RockPaperScissors> {
  int _userChoice = 0;
  int _cpuChoice = 0;
  String _result = '';

  void _playGame(int choice) {
    setState(() {
      _userChoice = choice;
      _cpuChoice = Random().nextInt(3) + 1;
      if (_userChoice == _cpuChoice) {
        _result = 'Draw!';
      } else if ((_userChoice - _cpuChoice) % 3 == 1) {
        _result = 'You Win!';
      } else {
        _result = 'You Lose!';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rock Paper Scissors'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            _result,
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => _playGame(1),
                child: Image.asset('assets/rock.png'),
              ),
              GestureDetector(
                onTap: () => _playGame(2),
                child: Image.asset('assets/paper.png'),
              ),
              GestureDetector(
                onTap: () => _playGame(3),
                child: Image.asset('assets/scissors.png'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}