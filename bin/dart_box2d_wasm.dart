import 'dart:io';

import 'package:wasm/wasm.dart';

void main(List<String> arguments) {
  final data = File('box2d.wasm').readAsBytesSync();
  final mod = WasmModule(data);
  // File('out3.text').writeAsStringSync(mod.describe());

  final inst = mod.builder().build();
  final setGravity =
      inst.lookupFunction('emscripten_bind_b2World_SetGravity_1');
  print(setGravity(0.0, -10.0));
}
