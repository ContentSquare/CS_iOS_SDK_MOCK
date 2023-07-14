// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CS_iOS_SDK",
    platforms: [.iOS(.v12)],
    products: [
        .library(
            name: "ContentsquareModule",
            targets: ["ContentsquareModuleWrapper"]),
        .library(
            name: "ContentsquareErrorAnalysisModule",
            targets: ["ContentsquareErrorAnalysisModuleWrapper"]
        )
    ],
    dependencies: [
        .package(
            name: "SwiftProtobuf",
            url: "https://github.com/apple/swift-protobuf.git",
            "1.15.0" ..< "2.0.0"),
        .package(
            name: "PLCrashReporter",
            url: "https://github.com/microsoft/plcrashreporter.git",
            "1.11.0" ..< "2.0.0"),
    ],
    targets: [
        // binaryTarget doesn't support dependency, use a wrapper to fix this.
        .target(
            name: "ContentsquareModuleWrapper",
            dependencies: [
                .target(name: "ContentsquareModule"),
                "SwiftProtobuf"
            ],
            path: "ContentsquareModuleWrapper",
            resources: [
                .process("ContentsquareBundle.bundle")
            ]
        ),
        .target(
            name: "ContentsquareErrorAnalysisModuleWrapper",
            dependencies: [
                .target(name: "ContentsquareErrorAnalysisModule"),
                .product(name: "CrashReporter", package: "PLCrashReporter"),
            ],
            path: "ContentsquareErrorAnalysisModuleWrapper"
        ),
        .binaryTarget(
            name: "ContentsquareModule",
            url: "https://github.com/ContentSquare/CS_iOS_SDK_MOCK/releases/download/4.24.0/ContentsquareModuleSwiftPackage.xcframework.zip",
            checksum: "0ac7fcf54ba54be35c67fb0fc646cbf224e259800308aac087f97b74d2bf62a2"),
        .binaryTarget(
            name: "ContentsquareErrorAnalysisModule",
            url: "https://github.com/ContentSquare/CS_iOS_SDK_MOCK/releases/download/4.24.0/ContentsquareErrorAnalysisModuleSwiftPackage.xcframework.zip",
            checksum: "dac9752621896f003acc60e78c5fee477da4f0bc7b4daa37a1d6be35cb708e1f"),
    ]
)