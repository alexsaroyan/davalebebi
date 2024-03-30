// swift-tools-version: 5.8

// WARNING:
// This file is automatically generated.
// Do not edit it by hand because the contents will be replaced.

import PackageDescription
import AppleProductTypes

let package = Package(
    name: "10",
    platforms: [
        .iOS("16.0")
    ],
    products: [
        .iOSApplication(
            name: "10",
            targets: ["AppModule"],
            bundleIdentifier: "Swift.-0",
            displayVersion: "1.0",
            bundleVersion: "1",
            appIcon: .placeholder(icon: .sun),
            accentColor: .presetColor(.red),
            supportedDeviceFamilies: [
                .pad,
                .phone
            ],
            supportedInterfaceOrientations: [
                .portrait,
                .landscapeRight,
                .landscapeLeft,
                .portraitUpsideDown(.when(deviceFamilies: [.pad]))
            ]
        )
    ],
    targets: [
        .executableTarget(
            name: "AppModule",
            path: "."
        )
    ]
)