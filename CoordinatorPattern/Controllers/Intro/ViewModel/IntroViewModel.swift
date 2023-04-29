//
//  IntroViewModel.swift
//  Architecture
//
//  Created by Siamak on 4/17/23.
//

import Foundation

class IntroViewModel: BaseViewModel {
   
    private var provider : IntroProviding = Resolver.shared.resolve(IntroProviding.self)
    var isNextView : Bool
    override init() {
        isNextView = provider.isNextViewState
       
    }
}

