// swift-tools-version:5.3.0

import PackageDescription

let name: String = "CoreUtils"

let package = Package(
    name: "CoreUtils",
    platforms: [
        .iOS("15")
    ],
    products: [
        .library(name: "CoreUtils", targets: ["CoreUtils"])
    ],
    targets: [
        .target(name: "CoreUtils", path: "Sources")
    ]
)
