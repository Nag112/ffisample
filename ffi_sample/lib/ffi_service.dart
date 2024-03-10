// ignore_for_file: unused_import, non_constant_identifier_names, camel_case_types, avoid_print
import 'dart:async';
import 'dart:ffi' as ffi;
import 'dart:isolate';
import 'package:ffi/ffi.dart';
import 'package:ffi_sample/bindings/game_bindings.dart';
import 'package:ffi_sample/generated/sudoku.pb.dart';

class FFIService {

  static late ffi.DynamicLibrary _dyLib;
  static late SendPort _sendPort;
  static late ReceivePort _receivePort;
  static late Isolate _isolate;

  final StreamController<String> _streamController = StreamController<String>.broadcast();
  Stream<String> get newStream => _streamController.stream;

   Future<void> init() async {
    _receivePort = ReceivePort();
    _isolate = await Isolate.spawn(_isolateEntryPoint, _receivePort.sendPort);
    _receivePort.listen((message) {
      if (message is String) {
        print('Received message: $message');
        _streamController.add(message);
      } else if (message is SendPort) {
        print('Received sendPort');
        _sendPort = message;
      }
    });
  }

  void getPuzzle() {
    _sendPort.send('getPuzzle');
  }

  static void _isolateEntryPoint(SendPort sendPort) {
    final receivePort = ReceivePort();
    _dyLib = ffi.DynamicLibrary.open('libgame.so');
    sendPort.send(receivePort.sendPort);
    receivePort.listen((message) {
      if (message is String) {
        print('isolate received message: $message');
        if (message == 'getPuzzle') {
            ffi.Pointer<ffi.Char> temp = GameBindings(_dyLib).GetSerializedPuzzle();
            sendPort.send(temp.cast<Utf8>().toDartString());
        }
      }
    });
  }

  void dispose() {
    _receivePort.close();
    _isolate.kill();
  }
}
