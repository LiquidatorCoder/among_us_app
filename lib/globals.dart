import 'package:flutter/cupertino.dart';

class RVProvider extends ChangeNotifier {
  int colorVariable = 1;
  int bgVariable = 1;

  int changeColorVariable(int newValue) {
    this.colorVariable = newValue;
    notifyListeners();
    return this.colorVariable;
  }

  int changeBGVariable(int newValue) {
    this.bgVariable = newValue;
    notifyListeners();
    return this.bgVariable;
  }
}
