//
//  IntroDI.swift
//  CoordinatorPattern
//
//  Created by Hossein Janati  on 4/29/23.
//

import Foundation

protocol IntroProviding {
    var isNextViewState : Bool { get }
}
class Introprovider : IntroProviding {
    var isNextViewState: Bool {
        return false
    }
}
