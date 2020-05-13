import 'package:flutter/foundation.dart';

class ExampleModel with ChangeNotifier {
  int _theNum;
  ExampleModel(this._theNum);
  void add() {
    _theNum++;
    notifyListeners();
  }
  void reduction(){
    _theNum--;
    notifyListeners();
  }
  int get theNum => _theNum;
}