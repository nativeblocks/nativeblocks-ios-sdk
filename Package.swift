// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Nativeblocks",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "Nativeblocks",
            targets: ["Nativeblocks"])
    ],
    targets: [
        .binaryTarget(
            name: "Nativeblocks",
            path: "NativeblocksCore.xcframework")
    ]
)
