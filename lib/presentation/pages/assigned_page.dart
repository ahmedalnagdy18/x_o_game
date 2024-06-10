import 'dart:math';
import 'package:flutter/material.dart';

class AssignedPage extends StatefulWidget {
  const AssignedPage({super.key});

  @override
  State<AssignedPage> createState() => _AssignedPageState();
}

class _AssignedPageState extends State<AssignedPage> {
  bool oTurn = true; // 1st player is O, computer is X
  List<String> displayElement = ['', '', '', '', '', '', '', '', ''];
  int oScore = 0;
  int xScore = 0;
  int filledBoxes = 0;
  bool gameOver = false;

  @override
  void initState() {
    super.initState();
    _resetBoard();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey.shade300,
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text('Name'), Text('Time')],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Player '${oTurn ? 'O' : 'X'}' Turn",
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              flex: 4,
              child: GridView.builder(
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      _tapped(index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          displayElement[index],
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 35,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _tapped(int index) {
    if (displayElement[index] != '' || !oTurn || gameOver) {
      return;
    }

    setState(() {
      displayElement[index] = 'O';
      filledBoxes++;
      oTurn = !oTurn;
      _checkWinner();
      if (!oTurn && !gameOver) {
        Future.delayed(const Duration(seconds: 1), _computerMove);
      }
    });
  }

  void _computerMove() {
    List<int> emptySpots = [];
    for (int i = 0; i < displayElement.length; i++) {
      if (displayElement[i] == '') {
        emptySpots.add(i);
      }
    }

    if (emptySpots.isNotEmpty && !gameOver) {
      int randomIndex = Random().nextInt(emptySpots.length);
      int computerMoveIndex = emptySpots[randomIndex];

      setState(() {
        displayElement[computerMoveIndex] = 'X';
        filledBoxes++;
        oTurn = !oTurn;
        _checkWinner();
      });
    }
  }

  void _resetBoard() {
    setState(() {
      displayElement = ['', '', '', '', '', '', '', '', ''];
      filledBoxes = 0;
      oTurn = true;
      gameOver = false;
    });
  }

  void _checkWinner() {
    List<List<int>> winningPatterns = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var pattern in winningPatterns) {
      String element1 = displayElement[pattern[0]];
      String element2 = displayElement[pattern[1]];
      String element3 = displayElement[pattern[2]];

      if (element1.isNotEmpty && element1 == element2 && element1 == element3) {
        gameOver = true;
        _showWinDialog(element1);
        return;
      }
    }

    if (filledBoxes == 9 && !gameOver) {
      gameOver = true;
      _showDrawDialog();
    }
  }

  void _showWinDialog(String winner) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Center(
          child: Text(
            "Winner is player '$winner'",
            style: const TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        actions: [
          Center(
            child: TextButton(
              style: const ButtonStyle(
                shape: MaterialStatePropertyAll(RoundedRectangleBorder()),
                backgroundColor: MaterialStatePropertyAll(Colors.teal),
              ),
              onPressed: () {
                Navigator.of(context).pop();
                _resetBoard();
              },
              child: const Text(
                " Ok ",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showDrawDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Draw!"),
        content: const Text("The game is a draw."),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _resetBoard();
            },
            child: const Text("Play Again"),
          ),
        ],
      ),
    );
  }
}