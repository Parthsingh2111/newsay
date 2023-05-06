import 'package:flutter/material.dart';




class Movementfun extends ChangeNotifier{
bool _iconchange=false;
bool get changecolor=>_iconchange;



void change(){
  _iconchange=!_iconchange;
  notifyListeners();
}


}