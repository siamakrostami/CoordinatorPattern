//
//  BaseViewModel.swift
//  Architecture
//
//  Created by Siamak on 4/17/23.
//

import Combine
import Foundation

class BaseViewModel {
    // MARK: Lifecycle

    deinit {
        NetworkManager.destroy()
        DependencyContainer.destroy()
    }
    
    // MARK: Internal

    let networkManager = NetworkManager.shared
    let dependencyContainer = DependencyContainer.shared
    let disboseBag = Set<AnyCancellable>()
    var error = CurrentValueSubject<Error?, Never>(nil)
}
