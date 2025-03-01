

Aim of this package is to provide libc and other fundamentals to Swift Embedded. 
To make it easier to develop with emsdk APIs.

To use this, you need to pass few parameters to `swift build` or make your root package include path to emsdk.


Something like this:

```bash
export EMSDK_SYSROOT="$EMSDK/upstream/emscripten/cache/sysroot"

export SWIFT_TOOLCHAIN=/Library/Developer/Toolchains/swift-6.1-DEVELOPMENT-SNAPSHOT-2025-02-21-a.xctoolchain

export JAVASCRIPTKIT_EXPERIMENTAL_EMBEDDED_WASM=true 

$SWIFT_TOOLCHAIN/usr/bin/swift build -c release --product EmbeddedApp \
  --triple wasm32-unknown-none-wasm \
  -Xswiftc -I -Xswiftc "${EMSDK_SYSROOT}/include" \
  -Xlinker -L -Xlinker "${EMSDK_SYSROOT}/lib/wasm32-emscripten" \
  --sdk "${EMSDK_SYSROOT}" 
  ```