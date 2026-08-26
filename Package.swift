// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-algebra-modular",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(
            name: "Algebra Modular",
            targets: ["Algebra Modular"]
        ),
        .library(
            name: "Algebra Modular Test Support",
            targets: ["Algebra Modular Test Support"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-molecules/swift-algebra.git",
            branch: "main"
        ),
        .package(
            url: "https://github.com/swift-molecules/swift-finite.git",
            branch: "main"
        ),
    ],
    targets: [
        .target(
            name: "Algebra Modular",
            dependencies: [
                .product(name: "Algebra Field", package: "swift-algebra"),
                .product(name: "Finite", package: "swift-finite"),
            ]
        ),
        .target(
            name: "Algebra Modular Test Support",
            dependencies: [
                "Algebra Modular"
            ],
            path: "Tests/Support"
        ),
        .testTarget(
            name: "Algebra Modular Tests",
            dependencies: [
                "Algebra Modular",
                "Algebra Modular Test Support",
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
        .enableUpcomingFeature("InferIsolatedConformances"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
