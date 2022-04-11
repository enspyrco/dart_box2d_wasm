# dart_box2d_wasm

*Experimenting Dart/WASM interop in a Dart app.*

The .wasm file comes from [box2d-wasm](https://github.com/Birch-san/box2d-wasm) where I

- followed the instructions in the READMEs to build
- copied `Box2D.wasm` from <repo>/box2d-wasm/dist/umd/Box2D.wasm

## One-time setup

Run:

```sh
dart run wasm:setup
```

## Run the app

```sh
dart run bin/dart_box2d_wasm.dart
```

The Dart app:

- loads the wasm as a `WasmModule`
- prints the available symbols
- builds an instance from the module
- looks up a functions in the instance for Box2D Vectors
- uses the functions to create a vector and calculate its length
