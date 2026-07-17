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
        .package(url: "https://github.com/appodeal/Appodeal-Swift-Package.git", .upToNextMajor(from: "4.0.0")),
        .package(url: "https://github.com/bidmachine/BidMachine-SPM.git", exact: "3.7.1"),
    ],
    targets: [
        .target(
            name: "AppodealBidMachineAdapterWrapper",
            dependencies: [
                .product(name: "Appodeal", package: "Appodeal-Swift-Package"),
                .product(name: "BidMachine", package: "BidMachine-SPM"),
                .target(name: "AppodealBidMachineAdapter"),
            ],
            path: "Sources",
            sources: ["Exports.swift"]
        ),
        .binaryTarget(
            name: "AppodealBidMachineAdapter",
            url: "https://s3-us-west-1.amazonaws.com/appodeal-ios/Appodeal/SPM/AppodealBidMachineAdapter/3.7.1.0/AppodealBidMachineAdapter.xcframework.zip",
            checksum: "016484dbbf4bd91035dfca37e1563e79418c87fe766e916349bec6459e7f3240"
        ),
    ]
)