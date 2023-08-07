//
//  BaseViewModel.swift
//  Architecture
//
//  Created by Siamak on 4/17/23.
//

import Foundation
import Combine

// MARK: - ViewModelProtocols

protocol ViewModelProtocols {
    associatedtype Dependency
    init(dependency: Dependency)
}

// MARK: - ViewModel

class BaseViewModel<DependenyType>: NSObject, ViewModelProtocols {
    // MARK: Lifecycle

    required init(dependency: Dependency) {
        self.dependency = dependency
    }

    // MARK: Internal

    typealias Dependency = DependenyType?

    var dependency: Dependency?
    let disboseBag = Set<AnyCancellable>()
    var error = CurrentValueSubject<Error?, Never>(nil)
}
