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
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/AppodealBidMachineAdapter/3.8.0.1/e20254eb8efe/AppodealBidMachineAdapter.xcframework.zip",
            checksum: "e20254eb8efe82e27ec7ca44f35f179a68c5bbc1c6da3d597d5f41f333a8120a"
        ),

    ]
)
