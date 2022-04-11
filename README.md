# dart_box2d_wasm

*Experimenting with Dart/WASM interop in a Dart app.*

The `Box2D.wasm` file comes from [box2d-wasm](https://github.com/Birch-san/box2d-wasm) where I:

- removed JS specific code from the C++ glue files before building (see [flutter_box2d plugin] for more details)
- otherwise, followed the instructions in the READMEs to build
- copied the `Box2D.wasm` file resulting from the build into this project

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
- looks up functions in the instance
- uses the functions to create a vector and calculate its length

[flutter_box2d plugin]: https://www.notion.so/enspyrco/Box2D-Plugin-3d3dc861ee4f439eb7e26deee3bac40a
