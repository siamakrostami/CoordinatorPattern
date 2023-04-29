//
//  ModalViewModel.swift
//  CoordinatorPattern
//
//  Created by Hossein Janati  on 4/29/23.
//

import Foundation

class ModalViewModel: BaseViewModel {
    var provider : ModalProviding = Resolver.shared.resolve(ModalProviding.self)
    override init() {
    }
}
