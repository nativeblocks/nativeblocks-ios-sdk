// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Nativeblocks",
    platforms: [.macOS(.v13), .iOS(.v15)],
    products: [
        .library(
            name: "Nativeblocks",
            targets: ["NativeblocksPrivate"]
        )
    ],
    targets: [
        .binaryTarget(
            name: "Nativeblocks",
            url: "TODO",
            checksum: "TODO"
        ),
        .target( 
            name: "NativeblocksPrivate",
            path: "./Sources/Empty"
        )
    ]
)