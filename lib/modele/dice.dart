import 'dart:math';

class Dice {
  int nbFace;
  int resultat = 0;

  Dice(this.nbFace);

  void setNbFace(int nbFace) {
    this.nbFace = nbFace;
  }

  int getNbFace() {
    return nbFace;
  }

  void setResultat(int resultat) {
    this.resultat = resultat;
  }

  int getResultat() {
    return resultat;
  }

  void lanceDe() {
    Random random = Random();
    resultat = random.nextInt(nbFace) + 1;
  }
}
