import 'package:flutter/material.dart';
import 'package:xogame/xo_game_screen.dart';
import 'package:xogame/xogame_arguments.dart';

class PlayerScreen extends StatelessWidget {
  static const String routeName = "PlayerScreen";
  String player1Name = '';
  String player2Name = '';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
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
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [

                SizedBox(height: MediaQuery.of(context).size.height * 0.15,),

                Text("Enter Player Name",
                style: TextStyle(
                  color: Colors.yellowAccent.shade700,
                  fontWeight: FontWeight.w900,
                  fontSize:35
                ),
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.12,),

                Text("Player 1",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
                ),

                Container(
                  padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width * 0.60,
                  child: TextField(
                    onChanged: (text){
                      player1Name = text;
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.white70,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintStyle: TextStyle(
                        color: Colors.black38,
                        fontSize: 20,
                      ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.06,),

                Text("Player 2",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                Container(
                  padding: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width * 0.60,
                  child: TextField(
                    onChanged: (text){
                      player2Name = text;
                    },
                    decoration: InputDecoration(
                      fillColor: Colors.white70,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintStyle: TextStyle(
                        color: Colors.black38,
                        fontSize: 20,
                      ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.12,),

                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow.shade700,
                      foregroundColor: Colors.black,
                      textStyle: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w700),
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.25,
                          vertical: MediaQuery.of(context).size.height * 0.02,),
                    ),
                    onPressed: () {
                      if(player1Name == '' || player2Name == ''){
                        return;
                      }else {
                        Navigator.of(context).pushNamed(XoGameScreen.routeName,
                            arguments: XoGameArguments(
                                xoPlayer1Name: player1Name,
                                xoPlayer2Name: player2Name
                            )
                        );
                      }
                    },
                    child: Text("Start Game")
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
