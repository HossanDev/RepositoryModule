// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RepositoryModule",
    
    platforms: [
      .iOS(.v16),
      .macOS(.v14)
    ],
    
    products: [
        .library(
            name: "RepositoryModule",
            targets: ["RepositoryModule"]),
    ],
    
    dependencies: [
        .package(url: "https://github.com/HossanDev/NetworkModule.git", branch: "main"),
    ],
    
    targets: [
        .target(
            name: "RepositoryModule",
            dependencies: [
                .product(name: "NetworkModule", package: "NetworkModule")
            ]
        ),
        .testTarget(
            name: "RepositoryModuleTests",
            dependencies: ["RepositoryModule"]
        ),
    ]
)

