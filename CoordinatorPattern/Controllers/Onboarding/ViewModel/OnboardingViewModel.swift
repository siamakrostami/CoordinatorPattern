//
//  ViewModel.swift
//  Architecture
//
//  Created by Siamak on 4/17/23.
//

import Foundation
import Combine

class OnboardingViewModel: BaseViewModel {
    private var provider : OnboardingProviding = Resolver.shared.resolve(OnboardingProviding.self)
    override init() {
    }
}
