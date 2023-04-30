//
//  DependencyContainer.swift
//  Architecture
//
//  Created by Siamak on 4/17/23.
//

import Foundation

class DependencyContainer {
    // MARK: Lifecycle

    init(networkServices: NetworkServices, applicationDataContainer: ApplicationDataContainer) {
        self.networkServices = networkServices
        self.applicationDataContainer = applicationDataContainer
    }

    // MARK: Internal

    var networkServices: NetworkServices
    var applicationDataContainer: ApplicationDataContainer
}
