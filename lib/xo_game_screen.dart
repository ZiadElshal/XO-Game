import 'package:flutter/material.dart';
import 'package:xogame/board_buttons.dart';
import 'package:xogame/player_bar.dart';
import 'package:xogame/xogame_arguments.dart';

class XoGameScreen extends StatefulWidget {
  static const String routeName = "XoGameScreen";

  @override
  State<XoGameScreen> createState() => _XoGameScreenState();
}

class _XoGameScreenState extends State<XoGameScreen> {
  List<String> boardState = [
    '','','',
    '','','',
    '','','',
  ];

  int player1Score = 0;
  int player2Score = 0;

  @override
  Widget build(BuildContext context) {

    XoGameArguments arguments = ModalRoute.of(context)?.settings.arguments as XoGameArguments;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.purple.shade700,
                  Colors.blue.shade700,

                ],
              ),
            ),
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    PlayerBar(text: "${arguments.xoPlayer1Name} (X)",
                      playerScore: player1Score,),
                    PlayerBar(text: "${arguments.xoPlayer2Name} (O)",
                      playerScore: player2Score,),
                  ],
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.11,),

                Row(
                  children: [
                    BoardButtons(text: boardState[0], index: 0, onButtonClick: onButtonClicked,),
                    BoardButtons(text: boardState[1], index: 1, onButtonClick: onButtonClicked,),
                    BoardButtons(text: boardState[2], index: 2, onButtonClick: onButtonClicked,),
                  ],
                ),
                Row(
                  children: [
                    BoardButtons(text: boardState[3], index: 3, onButtonClick: onButtonClicked,),
                    BoardButtons(text: boardState[4], index: 4, onButtonClick: onButtonClicked,),
                    BoardButtons(text: boardState[5], index: 5, onButtonClick: onButtonClicked,),
                  ],
                ),
                Row(
                  children: [
                    BoardButtons(text: boardState[6], index: 6, onButtonClick: onButtonClicked,),
                    BoardButtons(text: boardState[7], index: 7, onButtonClick: onButtonClicked,),
                    BoardButtons(text: boardState[8], index: 8, onButtonClick: onButtonClicked,),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.04,
            left: MediaQuery.of(context).size.height * 0.01,
            child: IconButton(
              icon: Icon(Icons.arrow_back,
              color: Colors.white,
              size: 30,),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }

  int counter = 0;
  void onButtonClicked(int index){
    if(boardState[index].isNotEmpty){
      return;
    }
    if(counter % 2 == 0){
      boardState[index] = "X";
    }else{
      boardState[index] = "O";
    }
    counter++;
    if(checkWinner("X")){
      player1Score += 1;
      showWinningAlert("Congratulations! Player1 is winning");
      initBoard();
    }else if(checkWinner("O")){
      player2Score += 1;
      showWinningAlert("Congratulations! Player2 is winning");
      initBoard();
    }else if(counter == 9){
      showWinningAlert("Draw! no winner");
      initBoard();
    }
    setState(() {

    });
  }

  bool checkWinner(String symbol){

    // rows
    for(int i = 0 ; i < 9 ; i+=3){
      if(boardState[i] == symbol &&
          boardState[i+1] == symbol &&
          boardState[i+2] == symbol) {
        return true;
      }
    }

    // columns
    for(int i = 0 ; i < 3 ; i++){
      if(boardState[i] == symbol &&
          boardState[i+3] == symbol &&
          boardState[i+6] == symbol) {
        return true;
      }
    }

    // diagonal
    if(boardState[0] == symbol &&
        boardState[4] == symbol &&
        boardState[8] == symbol) {
      return true;
    }
    if(boardState[2] == symbol &&
        boardState[4] == symbol &&
        boardState[6] == symbol) {
      return true;
    }

    return false;
  }

  void initBoard(){
    boardState = [
      '','','',
      '','','',
      '','','',
    ];
    counter = 0;
  }

  void showWinningAlert(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(message,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w700,

          ),
          ),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
              ),
              child: Text("OK",
              style: TextStyle(
                fontSize: 18,

              ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
        ]
        );
      },
    );
  }
}
