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
                .process("ContentsquareBundle.bundle"),
                .copy("PrivacyInfo.xcprivacy")
            ]
        ),
        .target(
            name: "ContentsquareErrorAnalysisModuleWrapper",
            dependencies: [
                .target(name: "ContentsquareErrorAnalysisModule"),
                .product(name: "CrashReporter", package: "PLCrashReporter"),
            ],
            path: "ContentsquareErrorAnalysisModuleWrapper",
            resources: [
                .copy("PrivacyInfo.xcprivacy")
            ]
        ),
        .binaryTarget(
            name: "ContentsquareModule",
            url: "https://github.com/ContentSquare/CS_iOS_SDK_MOCK/releases/download/4.28.0/ContentsquareModuleSwiftPackage.xcframework.zip",
            checksum: "99a7b2200f3300f0b540c9055fd9e82061977a5410a8d52ec41480b8e65e77b2"),
        .binaryTarget(
            name: "ContentsquareErrorAnalysisModule",
            url: "https://github.com/ContentSquare/CS_iOS_SDK_MOCK/releases/download/4.28.0/ContentsquareErrorAnalysisModuleSwiftPackage.xcframework.zip",
            checksum: "acd88bd70ce90a391118cc154ac6de8b7cf46dce2dda4cf4118a39a39d66012f"),
    ]
)