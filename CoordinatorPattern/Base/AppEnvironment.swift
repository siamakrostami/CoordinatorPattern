//
//  AppEnvironment.swift
//  CoordinatorPattern
//
//  Created by Siamak on 4/30/23.
//


import Foundation

// MARK: - AppEnvironment

struct AppEnvironment {
    let container: DependencyContainer
}

extension AppEnvironment {
    static func setup() -> Self {
        let container = DependencyContainer(networkServices: .init(apiRrequest: .init()), applicationDataContainer: .init())
        return AppEnvironment(container: container)
    }
}
