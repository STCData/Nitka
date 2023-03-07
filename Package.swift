// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "Nitka",
    products: [
        .library(
            name: "Nitka",
            targets: ["Nitka"]),
    ],
    dependencies: [
        .package(path: "./OpenAIReTreeable"),
        .package(url: "https://github.com/onevcat/Rainbow", .upToNextMajor(from: "4.0.0")),
        .package(url: "https://github.com/scottrhoyt/SwiftyTextTable.git", from: "0.5.0"),
        .package(url: "https://github.com/jakeheis/SwiftCLI", from: "6.0.0"),


    ],
    targets: [
        .target(
            name: "Nitka",
            dependencies: [
                "OpenAIReTreeable",
                "SwiftCLI",
                "Rainbow",
                "SwiftyTextTable",
            ]),
        .testTarget(
            name: "NitkaTests",
            dependencies: ["Nitka"]),
    ]
)
