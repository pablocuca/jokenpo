import 'package:flutter/material.dart';

class JokenPo extends StatefulWidget {
  @override
  _JokenPoState createState() => _JokenPoState();
}

class _JokenPoState extends State<JokenPo> {
  var paintResult = Colors.green;
  var textResult = "Voce ganhou";

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
                  child: Image.asset(
                    "assets/padrao.png",
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
                    textResult,
                    style: TextStyle(
                      color: paintResult,
                      fontSize: 22,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Image.asset(
                  "assets/pedra.png",
                  height: 80,
                ),
                Image.asset(
                  "assets/papel.png",
                  height: 80,
                ),
                Image.asset(
                  "assets/tesoura.png",
                  height: 80,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
