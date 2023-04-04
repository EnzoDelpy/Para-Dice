import 'dart:math';

import 'package:para_dice/modele/dice.dart';

class DicePool {
  List<Dice> lesDe = [];
  int nbDe = 1;
  int nbFace = 6;

  DicePool(this.nbDe, this.nbFace) {
    for (int k = 0; k < nbDe; k++) {
      lesDe.add(Dice(nbFace));
    }
  }

  void lanceDe() {
    for (Dice dice in lesDe) {
      dice.lanceDe();
    }
  }

  Map<int, int> getStatResultat() {
    Map<int, int> resultat = Map<int, int>();
    for (int k = 0; k < nbFace + 1; k++) {
      resultat[k] = 0;
    }

    for (Dice dice in lesDe) {
      resultat[dice.getResultat()] = resultat[dice.resultat]! + 1;
    }

    return resultat;
  }

  double getMoyenne() {
    double moyenne = 0;
    for (Dice dice in lesDe) {
      moyenne += dice.getResultat();
    }
    return moyenne / lesDe.length;
  }

  void resetDice() {
    for (Dice dice in lesDe) {
      dice.setResultat(0);
    }
  }

  void add10Dice() {
    for (int k = 0; k < 10; k++) {
      lesDe.add(Dice(nbFace));
    }
  }

  void add1Dice() {
    lesDe.add(Dice(nbFace));
  }

  void remove1Dice() {
    if (lesDe.length > 1) {
      lesDe.removeLast();
      log(1);
    }
  }

  void remove10Dice() {
    if (lesDe.length > 10) {
      for (int k = 0; k < 10; k++) {
        lesDe.removeLast();
      }
    } else {
      set1Dice();
    }
  }

  void set1Dice() {
    int nbRemove = lesDe.length;
    for (int k = 1; k < nbRemove; k++) {
      lesDe.removeLast();
    }
  }

  void updateFace() {
    for (Dice dice in lesDe) {
      dice.setNbFace(nbFace);
    }
  }

  void add10Face() {
    nbFace += 10;
  }

  void add1Face() {
    nbFace += 1;
  }

  void remove1Face() {
    if (nbFace > 2) {
      nbFace--;
    }
  }

  void remove10Face() {
    if (nbFace > 12) {
      nbFace -= 10;
    } else {
      set2Face();
    }
  }

  void set2Face() {
    nbFace = 2;
  }
}
