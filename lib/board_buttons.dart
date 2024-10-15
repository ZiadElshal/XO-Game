import 'package:flutter/material.dart';

class BoardButtons extends StatelessWidget{
  String text;
  int index;
  Function onButtonClick;

  BoardButtons({required this.text, required this.index, required this.onButtonClick,});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        height: MediaQuery.of(context).size.height * 0.17,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple.shade900,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: (){
                onButtonClick(index);
              },

              child: Text(text,
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                ),
              )
          ),
        ),
      ),
    );
  }

}