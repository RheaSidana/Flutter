import 'package:flutter/material.dart';
import 'package:testing_app/one.dart';
import 'package:testing_app/second.dart';
import 'package:testing_app/stackdemo.dart';
import 'package:testing_app/tictactoe.dart';
import 'package:testing_app/welcome.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    // theme: ThemeData.dark(),
    theme: ThemeData(
      fontFamily: 'Roboto',
      brightness: Brightness.light,
      primaryColor: Colors.black,
      // textTheme: TextTheme()
    ),
    title: 'Calculator',
    home: TicTacToe(),
    // home: SafeArea(
    //   child: Text(
    //     'Hello world',
    //     style: TextStyle(color: Colors.yellowAccent),
    //   ),
    // ),
  ));
}
