import 'dart:io';

import 'package:wasm/wasm.dart';

void main(List<String> arguments) {
  final data = File('box2d.wasm').readAsBytesSync();
  final mod = WasmModule(data);
  File('out.text').writeAsStringSync(mod.describe());

  var instanceBuilder = mod.builder();
  instanceBuilder.enableWasi();
  final instance = instanceBuilder.build();

  var b2Vec2Fn2 = instance.lookupFunction('emscripten_bind_b2Vec2_b2Vec2_2');
  var vecPtr = b2Vec2Fn2(10.0, 5.0);
  var b2Vec2LenghtFn0 =
      instance.lookupFunction('emscripten_bind_b2Vec2_Length_0');
  var length = b2Vec2LenghtFn0(vecPtr);
  print(length);
}
