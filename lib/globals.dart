import 'package:flutter/cupertino.dart';

final int colorSize = 14;
final int bgSize = 3;
final int hatSize = 7;
final int skinSize = 4;

class RVProvider extends ChangeNotifier {
  int colorVariable = 1;
  int bgVariable = 1;
  int hatVariable = 0;
  int skinVariable = 0;
  String nameVariable = "bot";

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

  int changeHatVariable(int newValue) {
    this.hatVariable = newValue;
    notifyListeners();
    return this.hatVariable;
  }

  int shiftHatVariable(bool add) {
    if (add == false) {
      if (this.hatVariable != 1 && this.hatVariable > 0) {
        this.hatVariable = this.hatVariable - 1;
      } else {
        this.hatVariable = 0;
      }
    } else {
      if (this.hatVariable != hatSize) this.hatVariable = this.hatVariable + 1;
    }
    notifyListeners();
    return this.hatVariable;
  }

  int changeSkinVariable(int newValue) {
    this.skinVariable = newValue;
    notifyListeners();
    return this.skinVariable;
  }

  int shiftSkinVariable(bool add) {
    if (add == false) {
      if (this.skinVariable != 1 && this.skinVariable > 0) {
        this.skinVariable = this.skinVariable - 1;
      } else {
        this.skinVariable = 0;
      }
    } else {
      if (this.skinVariable != skinSize)
        this.skinVariable = this.skinVariable + 1;
    }
    notifyListeners();
    return this.skinVariable;
  }

  String changeNameVariable(String newValue) {
    this.nameVariable = newValue;
    notifyListeners();
    return this.nameVariable;
  }
}
