// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "AppodealBidMachineAdapter",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "AppodealBidMachineAdapter",
            targets: ["AppodealBidMachineAdapterWrapper"]),
    ],
    dependencies: [
        .package(url: "https://github.com/appodeal/Appodeal-Swift-Package.git", .upToNextMajor(from: "4.3.0")),
        .package(url: "https://github.com/bidmachine/BidMachine-SPM", exact: "3.8.0"),
    ],
    targets: [
        .target(
            name: "AppodealBidMachineAdapterWrapper",
            dependencies: [
                .product(name: "AppodealSDK", package: "Appodeal-Swift-Package"),
                .product(name: "BidMachine", package: "BidMachine-SPM"),
                .target(name: "AppodealBidMachineAdapter"),
            ],
            path: "Sources",
            sources: ["Exports.swift"]
        ),
        .binaryTarget(
            name: "AppodealBidMachineAdapter",
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/AppodealBidMachineAdapter/3.8.0.0/8d77d7c8f13a/AppodealBidMachineAdapter.xcframework.zip",
            checksum: "8d77d7c8f13a2303c8728d5a5b74a155bddf69b332b04951ab95192422fead07"
        ),

    ]
)
