// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "Nitka",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .tvOS(.v13),
        .watchOS(.v6),
    ],

    products: [
        .library(
            name: "Nitka",
            targets: ["Nitka"]
        ),
    ],

    dependencies: [
        .package(url: "https://github.com/onevcat/Rainbow", .upToNextMajor(from: "3.2.0")),
        .package(url: "https://github.com/scottrhoyt/SwiftyTextTable.git", from: "0.5.0"),
        .package(url: "https://github.com/jakeheis/SwiftCLI", from: "6.0.0"),
        .package(url: "https://github.com/kiliankoe/CLISpinner", from: "0.4.0"),
        .package(url: "https://github.com/jpsim/Yams.git", from: "5.0.5"),
        .package(url: "https://github.com/STCData/TreePrinter.git", branch: "main"),
        .package(path: "./OpenAIReTreeable"),
    ],
    targets: [
        .target(
            name: "Nitka",
            dependencies: [
                "OpenAIReTreeable",
                "SwiftCLI",
                "Rainbow",
                "SwiftyTextTable",
                "CLISpinner",
                "Yams",
                "TreePrinter",
            ]
        ),
        .testTarget(
            name: "NitkaTests",
            dependencies: ["Nitka"]
        ),
    ]
)
