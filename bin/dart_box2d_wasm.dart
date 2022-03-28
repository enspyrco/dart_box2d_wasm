import 'dart:io';

import 'package:wasm/wasm.dart';

void main(List<String> arguments) {
  final data = File('box2d.wasm').readAsBytesSync();
  final mod = WasmModule(data);
  File('out.text').writeAsStringSync(mod.describe());

  var instanceBuilder = mod.builder();
  instanceBuilder.enableWasi();
  final instance = instanceBuilder.build();
  final shape =
  instance.lookupFunction('emscripten_bind_b2PolygonShape_b2PolygonShape_0');
  print(shape());
}
