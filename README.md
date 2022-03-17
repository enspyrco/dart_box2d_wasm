# dart_box2d_wasm

The .wasm file comes from [box2d-wasm](https://github.com/Birch-san/box2d-wasm)

One-time setup - run:

```sh
dart run wasm:setup
```

## Current problems

### Missing import (on x86 Mac)

This part runs and successfully creates the text file:

```dart
final data = File('Box2D.wasm').readAsBytesSync();
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

After reading <https://github.com/emscripten-core/emscripten/wiki/WebAssembly-Standalone> I attempted to build a standalone wasm module by to updating `EMCC_OPTS` in `build_wasm.sh` with:

```sh
  -s STANDALONE_WASM
  -fno-exceptions
  --no-entry
```

The `--no-entry` was needed to resolve build errors.

> Still getting same error

From **[Experimenting with Dart and Wasm](https://medium.com/dartlang/experimenting-with-dart-and-wasm-ef7f1c065577)**:

> *If we had additional non-WASI function imports we could use addFunction() to import a Dart function into the wasm library.*

The missing function is `array_bounds_check_error` - searching in box2d-wasm shows there's a bunch of files that have it, but they're all variations of `box2d_glue.cpp` and `Box2D.js`

Where do these files come from?

`build_all.sh` calls `build_idl_bindings.sh` and says:

> // use Box2D.idl to create ./box2d_glue.{js,cpp} for invoking functionality from libbox2d

In `build_idl_bindings.sh` the relevant line is
`"$PYTHON3" "$EMSCRIPTEN_TOOLS/webidl_binder.py" "$DIR/Box2D.idl" box2d_glue`

So it looks like `webidl_binder.py` is used create `box2d_glu.cpp` and `Box2D.js`

Next step: try to compile box2d_glue.cpp to WASM and call `addFunction` on the `wasmInstance` in Dart

### Failed to load dynamic library (on M1 Mac)

```dart
final mod = WasmModule(data);
```

Throws:

```sh
Unhandled exception:
Invalid argument(s): Failed to load dynamic library '/Users/nick/git/orgs/enspyrco/dart_box2d_wasm/.dart_tool/wasm/libwasmer.dylib': dlopen(/Users/nick/git/orgs/enspyrco/dart_box2d_wasm/.dart_tool/wasm/libwasmer.dylib, 0x0001): tried: '/Users/nick/git/orgs/enspyrco/dart_box2d_wasm/.dart_tool/wasm/libwasmer.dylib' (mach-o file, but is an incompatible architecture (have 'arm64', need 'x86_64')), '/usr/lib/libwasmer.dylib' (no such file)
```
