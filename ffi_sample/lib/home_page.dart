// ignore_for_file: avoid_print, 
import 'package:ffi_sample/ffi_service.dart';
import 'package:ffi_sample/generated/sudoku.pb.dart';
import 'package:flutter/material.dart';
import 'package:ffi_sample/bindings/game_bindings.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String newPuzzle = "";
  int id = 0;
  late GameBindings gameBindings;
  var ffiService = FFIService();

  void getNewPuzzle() {
    try {
      ffiService.getPuzzle();
    } catch (e, s) {
      print("Error: $e and $s");
    }
  }

  @override
  void initState() {
    super.initState();
    ffiService.init().then((value) {
          ffiService.newStream.listen((event) {
        setState(() {
          SudokuPuzzle sudoku = SudokuPuzzle.fromBuffer(event.codeUnits);
          newPuzzle = sudoku.puzzle;
          print("got new puzzle: at ${DateTime.now()}");
        });
      });
});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'latest puzzle:',
            ),
            Text(
              newPuzzle,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blue
              ),
              
            ),
            Text(
              "$id",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getNewPuzzle,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
