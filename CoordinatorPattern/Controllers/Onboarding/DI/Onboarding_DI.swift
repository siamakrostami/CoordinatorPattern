//
//  Onboarding_DI.swift
//  CoordinatorPattern
//
//  Created by Hossein Janati  on 4/29/23.
//

import Foundation

protocol OnboardingProviding {
    var isNextViewState : Bool { get }
}
class Onboardingprovider : OnboardingProviding {
    var isNextViewState: Bool {
        return false
    }
}
