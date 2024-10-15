import 'package:flutter/material.dart';
import 'package:xogame/player_screen.dart';
import 'package:xogame/xo_game_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: PlayerScreen.routeName,

      routes: {
        PlayerScreen.routeName : (context) => PlayerScreen(),
        XoGameScreen.routeName : (context) => XoGameScreen()
      },
    );
  }

}