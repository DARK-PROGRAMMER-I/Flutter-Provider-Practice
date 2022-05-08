import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Counter with ChangeNotifier{
  // Counter Section
  int _counter = 0;
  int get count => _counter;
  incrementCounter(){
    _counter += 1;
    notifyListeners();
  }

  // Color Section
  Color choseColor= Colors.red;
  List<Color> colors = [
    Colors.pink,
    Colors.greenAccent,
    Colors.yellow,
    Colors.blue,
    Colors.grey,
    Colors.blueGrey
  ];
  changeColor(){
    Random randVal = Random();
    int  val= randVal.nextInt(5);
    choseColor = colors[val];
    notifyListeners();
  }

  // Size Section
  List<double> sizes = [
    30,
    40,
    10,
    16,
    25
  ];
  double size = 20;
  chnageSizeOfText(){
    Random randVal = Random();
    int  val= randVal.nextInt(5);
    size = sizes[val];
    notifyListeners();
  }
}
