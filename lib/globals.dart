import 'package:flutter/cupertino.dart';

final int colorSize = 14;
final int bgSize = 3;

class RVProvider extends ChangeNotifier {
  int colorVariable = 1;
  int bgVariable = 1;

  int changeColorVariable(int newValue) {
    this.colorVariable = newValue;
    notifyListeners();
    return this.colorVariable;
  }

  int shiftColorVariable(bool add) {
    if (add == false) {
      if (this.colorVariable != 1) this.colorVariable = this.colorVariable - 1;
    } else {
      if (this.colorVariable != colorSize)
        this.colorVariable = this.colorVariable + 1;
    }
    notifyListeners();
    return this.colorVariable;
  }

  int changeBGVariable(int newValue) {
    this.bgVariable = newValue;
    notifyListeners();
    return this.bgVariable;
  }

  int shiftBGVariable(bool add) {
    if (add == false) {
      if (this.bgVariable != 1) this.bgVariable = this.bgVariable - 1;
    } else {
      if (this.bgVariable != bgSize) this.bgVariable = this.bgVariable + 1;
    }
    notifyListeners();
    return this.bgVariable;
  }
}
