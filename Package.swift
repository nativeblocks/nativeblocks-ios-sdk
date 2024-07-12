// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "NativeblocksCore",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "NativeblocksCore",
            targets: ["NativeblocksCore"])
    ],
    targets: [
        .binaryTarget(
            name: "NativeblocksCore",
            path: "NativeblocksCore.xcframework")
    ])
