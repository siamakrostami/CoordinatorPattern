//
//  NetworkServices.swift
//  CoordinatorPattern
//
//  Created by Siamak on 4/30/23.
//

import Foundation

struct NetworkServices {
    
    // MARK: -Private
    private let apiRrequest: APIRequest
    
    // MARK: - Lifecycle
    init(apiRrequest: APIRequest) {
        self.apiRrequest = apiRrequest
    }
    
    // MARK: - Internal
    lazy var authenticationRepository: AuthenticationRepository? = .init(apiRrequest: self.apiRrequest)
}
