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
        

    ],
    targets: [
        .target(
            name: "Nitka",
            dependencies: []),
        .testTarget(
            name: "NitkaTests",
            dependencies: ["Nitka"]),
    ]
)
