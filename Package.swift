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
        .package(url: "https://github.com/appodeal/Appodeal-Swift-Package.git", .upToNextMajor(from: "4.0.0-alpha.1")),
        .package(url: "https://github.com/bidmachine/BidMachine-iOS-SDK", from: "3.0.0"),
    ],
    targets: [
        .target(
            name: "AppodealBidMachineAdapterWrapper",
            dependencies: [
                .product(name: "AppodealSDK", package: "Appodeal-Swift-Package"),
                .product(name: "BidMachine", package: "BidMachine-iOS-SDK"),
                .target(name: "AppodealBidMachineAdapter"),
            ],
            path: "Sources",
            sources: ["Exports.swift"]
        ),
        .binaryTarget(
            name: "AppodealBidMachineAdapter",
            url: "https://s3-us-west-1.amazonaws.com/appodeal-ios/Appodeal/SPM/AppodealBidMachineAdapter/4.3.0/AppodealBidMachineAdapter.xcframework.zip",
            checksum: "b8138e53a938684509e48dbbd0776980f8866df160ea046d9bb5a31adb98a470"
        ),
    ]
)
