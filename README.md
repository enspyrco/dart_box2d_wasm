# dart_box2d_wasm

One-time setup - run:

```sh
dart run wasm:setup
```

## Current problems

### Missing import (on x86 Mac)

This part runs and successfully creates the text file:

```dart
final data = File('Box2D.bare.wasm').readAsBytesSync();
final mod = WasmModule(data);
File('out.text').writeAsStringSync(mod.describe());
```

But the next line

```dart
final inst = mod.builder().build();
```

Throws:

```sh
Exception has occurred.
WasmError (WasmError: Missing import: function: void env::array_bounds_check_error(int32, int32))
```

### Missing import (on x86 Mac) - progress

I attempted to build a standalone wasm module by adding:

```sh
-s STANDALONE_WASM
--no-entry
```

as per: <https://github.com/emscripten-core/emscripten/wiki/WebAssembly-Standalone>


### Failed to load dynamic library (on M1 Mac)

```dart
final mod = WasmModule(data);
```

Throws:

```sh
Unhandled exception:
Invalid argument(s): Failed to load dynamic library '/Users/nick/git/orgs/enspyrco/dart_box2d_wasm/.dart_tool/wasm/libwasmer.dylib': dlopen(/Users/nick/git/orgs/enspyrco/dart_box2d_wasm/.dart_tool/wasm/libwasmer.dylib, 0x0001): tried: '/Users/nick/git/orgs/enspyrco/dart_box2d_wasm/.dart_tool/wasm/libwasmer.dylib' (mach-o file, but is an incompatible architecture (have 'arm64', need 'x86_64')), '/usr/lib/libwasmer.dylib' (no such file)
```
