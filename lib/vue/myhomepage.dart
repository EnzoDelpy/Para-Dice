import 'package:flutter/material.dart';
import 'package:para_dice/modele/dicepool.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int nbDe = 1;
  DicePool dicepool = DicePool(1, 6);
  List<Widget> lesStats = [];

  void lanceDe() {
    setState(() {
      dicepool.lanceDe();
    });
  }

  void buildStats() {
    lesStats = [];
    for (int k = 1; k <= dicepool.nbFace; k += 2) {
      if (k + 1 <= dicepool.nbFace) {
        lesStats.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Nombre de ' + k.toString() + ': ' + dicepool.getStatResultat()[k].toString()),
              Text('Nombre de ' + (k + 1).toString() + ': ' + dicepool.getStatResultat()[k + 1].toString())
            ],
          ),
        );
      } else {
        lesStats.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Nombre de ' + k.toString() + ': ' + dicepool.getStatResultat()[k].toString()),
            ],
          ),
        );
      }
    }
    setState(() {
      lesStats;
    });
  }

  @override
  Widget build(BuildContext context) {
    buildStats();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () => {
                    setState(() {
                      dicepool.remove10Dice();
                      dicepool.resetDice();
                    })
                  },
                  child: Text('-10', style: TextStyle(color: Colors.green)),
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white)),
                ),
                ElevatedButton(
                    onPressed: () => {
                          setState(() {
                            dicepool.remove1Dice();
                            dicepool.resetDice();
                          })
                        },
                    child: Text(
                      '-1',
                      style: TextStyle(color: Colors.green),
                    ),
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white))),
                ElevatedButton(
                    onPressed: () => {
                          setState(() {
                            dicepool.set1Dice();
                            dicepool.resetDice();
                          })
                        },
                    child: Text('1', style: TextStyle(color: Colors.green)),
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white))),
                ElevatedButton(
                    onPressed: () => {
                          setState(() {
                            dicepool.add1Dice();
                            dicepool.resetDice();
                          })
                        },
                    child: Text('+1', style: TextStyle(color: Colors.green)),
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white))),
                ElevatedButton(
                    onPressed: () => {
                          setState(() {
                            dicepool.add10Dice();
                            dicepool.resetDice();
                          })
                        },
                    child: Text('+10', style: TextStyle(color: Colors.green)),
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white)))
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text(
                  '  Nombre de dé:  ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(dicepool.lesDe.length.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.green))
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () => {
                    setState(() {
                      dicepool.remove10Face();
                      dicepool.resetDice();
                      dicepool.updateFace();
                    })
                  },
                  child: Text('-10', style: TextStyle(color: Colors.green)),
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white)),
                ),
                ElevatedButton(
                    onPressed: () => {
                          setState(() {
                            dicepool.remove1Face();
                            dicepool.resetDice();
                            dicepool.updateFace();
                          })
                        },
                    child: Text(
                      '-1',
                      style: TextStyle(color: Colors.green),
                    ),
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white))),
                ElevatedButton(
                    onPressed: () => {
                          setState(() {
                            dicepool.set2Face();
                            dicepool.resetDice();
                            dicepool.updateFace();
                          })
                        },
                    child: Text('2', style: TextStyle(color: Colors.green)),
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white))),
                ElevatedButton(
                    onPressed: () => {
                          setState(() {
                            dicepool.add1Face();
                            dicepool.resetDice();
                            dicepool.updateFace();
                          })
                        },
                    child: Text('+1', style: TextStyle(color: Colors.green)),
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white))),
                ElevatedButton(
                    onPressed: () => {
                          setState(() {
                            dicepool.add10Face();
                            dicepool.resetDice();
                            dicepool.updateFace();
                          })
                        },
                    child: Text('+10', style: TextStyle(color: Colors.green)),
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.white)))
              ],
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Text(
                  '  Nombre de face:  ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(dicepool.nbFace.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.green))
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              '  Les résultats:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            const SizedBox(height: 10),
            ...lesStats,
            const SizedBox(height: 10),
            Text('Moyenne obtenue: ' + dicepool.getMoyenne().toString())
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: lanceDe,
        tooltip: 'Increment',
        child: const Icon(Icons.casino),
      ),
    );
  }
}
