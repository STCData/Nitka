// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "OpenAIReTreeable",
    products: [
        .library(
            name: "OpenAIReTreeable",
            targets: ["OpenAIReTreeable"]),
    ],
    dependencies: [
        .package(url: "https://github.com/adamrushy/OpenAISwift.git", from: "1.2.0"),
        .package(url: "https://github.com/STCData/SwiftDiffPatch.git", branch: "main")
    ],
    targets: [
        .target(
            name: "OpenAIReTreeable",
            dependencies: [
                "OpenAISwift",
                "SwiftDiffPatch"
            ]),
        .testTarget(
            name: "OpenAIReTreeableTests",
            dependencies: ["OpenAIReTreeable"]),
    ]
)
