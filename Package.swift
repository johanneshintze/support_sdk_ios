// swift-tools-version:5.3
import PackageDescription
let package = Package(
    name: "ZendeskSupportSDK",
    platforms: [
        .iOS(.v10)
    ],
    products: [
        .library(
            name: "ZendeskSupportSDK",
            targets: [
              "ZendeskSupportSDKTargets"
            ]
        )
    ],
    dependencies: [
        .package(name: "ZendeskSupportProvidersSDK",
                 url: "https://github.com/johanneshintze/support_providers_sdk_ios",
                 .exact("5.4.1")),
        .package(name: "ZendeskMessagingSDK",
                 url: "https://github.com/johanneshintze/messaging_sdk_ios",
                 .exact("3.8.4"))
    ],
    targets: [
        .binaryTarget(
            name: "ZendeskSupportSDK",
            path: "ZendeskSupportSDK.xcframework"
        ),
        .target(name: "ZendeskSupportSDKTargets",
                dependencies: [
                    .target(name: "ZendeskSupportSDK"),
                    .product(name: "ZendeskSupportProvidersSDK", package: "ZendeskSupportProvidersSDK"),
                    .product(name: "ZendeskMessagingSDK", package: "ZendeskMessagingSDK")
                ],
                path: "Sources"
        )
    ]
)
