import 'dart:io';

import 'package:wasm/wasm.dart';

void main(List<String> arguments) {
  final data = File('Box2D.wasm').readAsBytesSync();
  final mod = WasmModule(data);
  // File('out.text').writeAsStringSync(mod.describe());

  var instanceBuilder = mod.builder();
  // instanceBuilder.addFunction(moduleName, name, fn)
  instanceBuilder.enableWasi();
  final instance = instanceBuilder.build();
  // final setGravity =
  // inst.lookupFunction('emscripten_bind_b2World_SetGravity_1');
  // print(setGravity(0.0, -10.0));
}
