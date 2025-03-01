// swift-tools-version:6.0

import PackageDescription


let package = Package(
    name: "emswiften",
    platforms: [.macOS(.v15)],
    products: [
        .library(name: "emswiften", targets: ["SwiftEmbeddedMissing"]),
    ],
    targets: [
        .systemLibrary(name: "emsdk"),
        .target(
            name: "SwiftEmbeddedMissing",
            dependencies: ["emsdk"],
            cSettings: [
                .unsafeFlags(["-fdeclspec"]),
            ],
            swiftSettings: [
                .enableExperimentalFeature("Embedded"),
                .enableExperimentalFeature("Extern"),
                .unsafeFlags([
                    "-Xfrontend", "-emit-empty-object-file",
                ]),
            ],
            linkerSettings: [
                // .unsafeFlags(["-L./upstream/emscripten/cache/sysroot/lib/wasm32-emscripten"]),
                .linkedLibrary("c"),
                .linkedLibrary("compiler_rt")
            ]            
        ),
    ]
)
