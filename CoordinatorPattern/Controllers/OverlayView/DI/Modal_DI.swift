//
//  Modal_DI.swift
//  CoordinatorPattern
//
//  Created by Hossein Janati  on 4/29/23.
//

import Foundation

protocol ModalProviding {
    var isNextViewState : Bool { get }
}
class Modalprovider : ModalProviding {
    var isNextViewState: Bool {
        return false
    }
}
