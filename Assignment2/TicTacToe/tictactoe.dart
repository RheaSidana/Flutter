import 'package:flutter/material.dart';

class TicTacToe extends StatefulWidget {
  @override
  _TicTacToeState createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  List<GameButton> buttonList;
  var player1;
  var player2;
  var activePlayer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    buttonList = doInt();
  }

  List<GameButton> doInt() {
    player1 = new List();
    player2 = new List();
    activePlayer = 1;
    var gameButtons = [
      GameButton(id: 1),
      GameButton(id: 2),
      GameButton(id: 3),
      GameButton(id: 4),
      GameButton(id: 5),
      GameButton(id: 6),
      GameButton(id: 7),
      GameButton(id: 8),
      GameButton(id: 9),
    ];
    return gameButtons;
  }

  void playGame(GameButton gb) {
    setState(() {
      if (activePlayer == 1) {
        gb.text = "X";
        gb.bg = Colors.red;
        activePlayer = 2;
        player1.add(gb.id);
      } else {
        gb.text = "0";
        gb.bg = Colors.black;
        activePlayer = 1;
        player2.add(gb.id);
      }
      gb.enable = false;
      int winner = checkWinner();
      if (winner == -1) {
        if (buttonList.every((element) => element.text != '')) {
          showDialog(
              context: context,
              builder: (_) => _alertDialog(
                  'Game Tied',
                  "Press the reset button to start again.",
                  _resetGame,
                  'Reset'));
        }
      }
    });
  }

  int checkWinner() {
    var winner = -1;
    if (player1.contains(1) && player1.contains(2) && player1.contains(3)) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(2) && player2.contains(3)) {
      winner = 2;
    }
    //row2
    if (player1.contains(4) && player1.contains(5) && player1.contains(6)) {
      winner = 1;
    }
    if (player2.contains(4) && player2.contains(5) && player2.contains(6)) {
      winner = 2;
    }
    //row3
    if (player1.contains(7) && player1.contains(8) && player1.contains(9)) {
      winner = 1;
    }
    if (player2.contains(7) && player2.contains(8) && player2.contains(9)) {
      winner = 2;
    }
    //col1
    if (player1.contains(1) && player1.contains(4) && player1.contains(7)) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(4) && player2.contains(7)) {
      winner = 2;
    }
    //col2
    if (player1.contains(2) && player1.contains(5) && player1.contains(8)) {
      winner = 1;
    }
    if (player2.contains(2) && player2.contains(5) && player2.contains(8)) {
      winner = 2;
    }
    //col3
    if (player1.contains(3) && player1.contains(6) && player1.contains(9)) {
      winner = 1;
    }
    if (player2.contains(3) && player2.contains(6) && player2.contains(9)) {
      winner = 2;
    }
    //diagonal1
    if (player1.contains(1) && player1.contains(5) && player1.contains(9)) {
      winner = 1;
    }
    if (player2.contains(1) && player2.contains(5) && player2.contains(9)) {
      winner = 2;
    }
    //diagonal2
    if (player1.contains(3) && player1.contains(5) && player1.contains(7)) {
      winner = 1;
    }
    if (player2.contains(3) && player2.contains(5) && player2.contains(7)) {
      winner = 2;
    }
    if (winner != -1) {
      if (winner == 1) {
        showDialog(
            context: context,
            builder: (_) => _alertDialog('Player 1 Won',
                "Press the reset button to start again.", _resetGame, 'Reset'));
      } else {
        showDialog(
            context: context,
            builder: (_) => _alertDialog('Player 2 Won',
                "Press the reset button to start again.", _resetGame, 'Reset'));
      }
    }
    return winner;
  }

  _resetGame() {
    if (Navigator.canPop(context)) Navigator.pop(context);
    setState(() {
      buttonList = doInt();
    });
  }

  _alertDialog(var title, var content, callBack, [var actionText]) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        FlatButton(
          onPressed: callBack,
          child: Text(actionText),
          color: Colors.white,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic Tac Toe'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 9.0,
                  mainAxisSpacing: 9.0),
              itemCount: buttonList.length,
              itemBuilder: (context, i) => SizedBox(
                width: 100,
                height: 100,
                child: RaisedButton(
                  padding: const EdgeInsets.all(8.0),
                  onPressed: buttonList[i].enable
                      ? () => playGame(buttonList[i])
                      : null,
                  child: Text(
                    buttonList[i].text,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  color: buttonList[i].bg,
                  disabledColor: buttonList[i].bg,
                ),
              ),
            ),
          ),
          RaisedButton(
            onPressed: _resetGame,
            child: Text(
              'Reset',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
            color: Colors.red,
            padding: EdgeInsets.all(20.0),
          )
        ],
      ),
    );
  }
}

class GameButton {
  final id;
  String text;
  bool enable;
  Color bg;
  GameButton(
      {this.id, this.text = '', this.bg = Colors.grey, this.enable = true});
}
