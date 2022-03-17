# dart_box2d_wasm

One-time setup - run:

`dart run wasm:setup`

## Current problems

### Running on M1 Mac

Gives:

```sh
Unhandled exception:
Invalid argument(s): Failed to load dynamic library '/Users/nick/git/orgs/enspyrco/dart_box2d_wasm/.dart_tool/wasm/libwasmer.dylib': dlopen(/Users/nick/git/orgs/enspyrco/dart_box2d_wasm/.dart_tool/wasm/libwasmer.dylib, 0x0001): tried: '/Users/nick/git/orgs/enspyrco/dart_box2d_wasm/.dart_tool/wasm/libwasmer.dylib' (mach-o file, but is an incompatible architecture (have 'arm64', need 'x86_64')), '/usr/lib/libwasmer.dylib' (no such file)
```
