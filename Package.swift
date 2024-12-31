// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import Foundation

let package = Package(
    name: "ArcXP",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "ArcXP",
            targets: [.BinaryTarget.arcXPsdk,
                      .BinaryTarget.googleAds,
                      .BinaryTarget.omSDK,
                      .BinaryTarget.palSDK])
    ],
    targets: [
        .BinaryTarget.arcXPsdk,
        .BinaryTarget.googleAds,
        .BinaryTarget.omSDK,
        .BinaryTarget.palSDK
    ]
)

extension Target {
    
    enum BinaryTarget {
        static let arcXPsdk = binaryTarget(
            name: .BinaryTarget.arcXPsdk,
            remoteChecksum: .CheckSum.arcXPsdk_CS
        )

        static let googleAds = binaryTarget(
            name: .BinaryTarget.googleAds,
            remoteChecksum: .CheckSum.googleAds_CS
        )

        static let omSDK = binaryTarget(
            name: .BinaryTarget.omSDK,
            remoteChecksum: .CheckSum.omSDK_CS
        )

        static let palSDK = binaryTarget(
            name: .BinaryTarget.palSDK,
            remoteChecksum: .CheckSum.palSDK_CS
        )
    }

    static func binaryTarget(name: String, remoteChecksum: String) -> Target {
        return .binaryTarget(
            name: name,
            url: remoteBinaryURLString(for: name),
            checksum: remoteChecksum
        )
    }
    
    static func remoteBinaryURLString(for targetName: String) -> String {
        return "https://github.com/arcxp/arcxpSDK-iOS-package/raw/refs/heads/main/\(targetName).zip"
    }
}

extension String {
    enum BinaryTarget {
        static let arcXPsdk = "ArcXP"
        static let googleAds = "GoogleInteractiveMediaAds"
        static let omSDK = "OMSDK_Washpost"
        static let palSDK = "ProgrammaticAccessLibrary"
    }
    
    enum CheckSum {
        static let arcXPsdk_CS = "ac1c510930331bdc6697d25e59218e11cc9cd2cb72bc603c113646c6b23c8815"
        static let googleAds_CS = "951cedf7a5accc6da8271033ebe790d2c092259777a7b1262ecdbb3023a9b4eb"
        static let omSDK_CS = "eaab4f3b4567ecc10c0a9db5c8984e0875af913d7f4342e2b433e57f2741ee73"
        static let palSDK_CS = "deb45346c8d5717088854f997111aa6aed80eb70491b48cbcfbcaa6d27d0dca7"
    }
}
