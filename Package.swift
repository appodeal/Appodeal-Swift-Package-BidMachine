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
        .package(url: "https://github.com/bidmachine/BidMachine-SPM.git", exact: "3.7.1"),
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
            url: "https://appodeal-ios.s3.us-west-1.amazonaws.com/Appodeal/SPM/AppodealBidMachineAdapter/3.7.1.1/AppodealBidMachineAdapter.xcframework.zip",
            checksum: "9e65797655cbaac5874d26a7bdfa0cb8246028ea3af7333b71aef7ad69db40cf"
        ),
    ]
)