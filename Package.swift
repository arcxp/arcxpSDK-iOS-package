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
        return "https://d3mh65msdilczf.cloudfront.net/home/iosArcXPSDK/version_1.0.1/SDK/\(targetName).zip" 
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
        static let arcXPsdk_CS = "e856b4079118c31e1ab73cfc4ee320eb67e63bcb4150eed7ea8c3a5388ddab8e"
        static let googleAds_CS = "0e5e04657f45283a86c1917788c6a6cbdef6cf01c916ea4c49f2dd4318f58076"
        static let omSDK_CS = "7f7ee94560c064f0bf4c38b0d23ccb6f8f832453f5c18ab33dccae8ca5479ace"
        static let palSDK_CS = "a18b0d9be6e118080246e1c962adc872f1d2e3012acd948d14758be477ea27bd"
    }
}
