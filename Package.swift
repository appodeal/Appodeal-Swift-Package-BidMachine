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
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/AppodealBidMachineAdapter/3.8.0.2/67a6ffaf13b6/AppodealBidMachineAdapter.xcframework.zip",
            checksum: "67a6ffaf13b6e90066c0a81738616731454101e2cc13ac0a163799bfa5593c6c"
        ),

    ]
)
