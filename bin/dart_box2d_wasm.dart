import 'dart:io';

import 'package:wasm/wasm.dart';

void main(List<String> arguments) {
  final data = File('Box2D.wasm').readAsBytesSync();
  final mod = WasmModule(data);
  print(mod.describe());
}

  // final inst = mod.builder().build();
  // final square = inst.lookupFunction('square');
  // print(square(12));