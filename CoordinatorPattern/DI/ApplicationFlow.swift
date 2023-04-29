//
//  ApplicationFlow.swift
//  Architecture
//
//  Created by Siamak on 4/17/23.
//

import Foundation

// MARK: - ApplicationFlow

enum ApplicationFlow {
    case splash
    case onboarding
    case loginWithCredentials
    case loginWithoutCredentials
    case dashboard
    case simulator
    case jailbreak
    case intro
    case register
    case forceUpdate(url: String)
    case profile
}

// MARK: Equatable

extension ApplicationFlow: Equatable {
    static func == (lhs: ApplicationFlow, rhs: ApplicationFlow) -> Bool {
        switch (lhs, rhs) {
        case (.dashboard, .dashboard),
             (.forceUpdate, .forceUpdate),
             (.intro, .intro),
             (.jailbreak, .jailbreak),
             (.loginWithCredentials, .loginWithCredentials),
             (.loginWithoutCredentials, .loginWithoutCredentials),
             (.onboarding, .onboarding),
             (.profile, .profile),
             (.register, .register),
             (.simulator, .simulator),
             (.splash, .splash):
            return true
        default:
            return false
        }
    }
}
