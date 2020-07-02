import 'package:flutter/material.dart';
import 'dart:math';

class JokenPo extends StatefulWidget {
  @override
  _JokenPoState createState() => _JokenPoState();
}

enum Hands {
  stone, //0
  paper, //1
  scissors, //2
}

class _JokenPoState extends State<JokenPo> {
  var _paintResult, _textResult, _imageResult;

  void initState() {
    super.initState();
    playGame();
  }

  void selectedOption(Hands chooseUser) {
    var images = [
      AssetImage('assets/pedra.png'),
      AssetImage('assets/papel.png'),
      AssetImage('assets/tesoura.png')
    ];

    var randonHands = Random().nextInt(Hands.values.length);
    var chooseApp = Hands.values[randonHands];

    setState(() {
      _imageResult = images[randonHands];
    });

    if (chooseApp == chooseUser) {
      setState(() {
        _paintResult = Colors.orange;
        _textResult = "Ixi Empate!!!";
      });
      return;
    }

    var wins = ['02', '10', '21'];
    var batlle = chooseUser.index.toString() + chooseApp.index.toString();

    if (wins.contains(batlle)) {
      setState(() {
        _paintResult = Colors.green;
        _textResult = "Uhuu Ganhou!!!";
      });
    } else {
      _paintResult = Colors.red;
      _textResult = "Xii Perdeu!!!";
    }
  }

  void playGame() {
    setState(() {
      _paintResult = Colors.black;
      _textResult = "Escolha uma opcao abaixo";
      _imageResult = AssetImage("assets/padrao.png");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Joken Po"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    "Escolha do App",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Image(
                    image: _imageResult,
                    height: 100,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    _textResult,
                    style: TextStyle(
                      color: _paintResult,
                      fontSize: 22,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: () => selectedOption(Hands.stone),
                  child: Image.asset(
                    "assets/pedra.png",
                    height: 80,
                  ),
                ),
                GestureDetector(
                  onTap: () => selectedOption(Hands.paper),
                  child: Image.asset(
                    "assets/papel.png",
                    height: 80,
                  ),
                ),
                GestureDetector(
                  onTap: () => selectedOption(Hands.scissors),
                  child: Image.asset(
                    "assets/tesoura.png",
                    height: 80,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: RaisedButton(
                    onPressed: () => playGame(),
                    child: Text(
                      'Recomecar',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    color: Colors.blue,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
