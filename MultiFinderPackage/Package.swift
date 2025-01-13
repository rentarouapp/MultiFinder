// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MultiFinderPackage",
    platforms: [.iOS(.v16)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(name: "MultiFinderPackage", targets: ["MultiFinderPackage"]),
        .library(name: "API", targets: ["API"]),
        .library(name: "Entity", targets: ["Entity"]),
        .library(name: "Feature", targets: ["Feature"]),
        .library(name: "View", targets: ["View"]),
    ],
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture.git", exact: "1.16.1"),
        .package(url: "https://github.com/rentarouapp/CocoaNetworkingMonitor.git", .upToNextMajor(from: "0.1.0")),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "MultiFinderPackage"),
        .testTarget(
            name: "MultiFinderPackageTests",
            dependencies: ["MultiFinderPackage"]
        ),
        .target(name: "Entity", dependencies: []),
        .target(name: "API", dependencies: ["Entity"]),
        .target(name: "Feature",
                dependencies: [
                    "Entity",
                    "API",
                    "CocoaNetworkingMonitor",
                    .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                ]
               ),
        .target(name: "View", dependencies: ["Feature"]),
    ]
)
