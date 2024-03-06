import 'package:ffi/ffi.dart';
import 'package:ffi_sample/generated/sudoku.pb.dart';
import 'package:flutter/material.dart';
// import bindings
import 'package:ffi_sample/bindings/game_bindings.dart';
import 'dart:ffi' as ffi;

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

  void _incrementCounter() {
    try {
      // print time
      print(DateTime.now());
      ffi.Pointer<ffi.Char> temp = gameBindings.GetSerializedPuzzle();
      newPuzzle = temp.cast<Utf8>().toDartString();
      SudokuPuzzle puzzle = SudokuPuzzle.fromBuffer(newPuzzle.codeUnits);
      newPuzzle = puzzle.puzzle;
      id = puzzle.id;
      setState(() {
        print("got new puzzle: at ${DateTime.now()}");
      });
      // print time
      print("AFter ${DateTime.now()}");
    } catch (e, s) {
      print("Error: $e and $s");
    }
  }

  @override
  void initState() {
    super.initState();
    // get path to the dynamic library from assets
    var dyLib = ffi.DynamicLibrary.open('libgame.so');
    gameBindings = GameBindings(dyLib);
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
              'You have pushed the button this many times:',
            ),
            Text(
              newPuzzle,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              "$id",
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
