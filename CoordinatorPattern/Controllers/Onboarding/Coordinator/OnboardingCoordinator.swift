//
//  OnboardingCoordinator.swift
//  Architecture
//
//  Created by Siamak on 4/17/23.
//

import Foundation
import UIKit

extension BaseCoordinator {
    //MARK: - Create ViewController for Root
    func openOnboarding(dependency: DependencyContainer) -> UIViewController {
        let controller = OnboardingViewController.instantiateViewController()
        controller.viewModel = .init(dependency: dependency)
        controller.coordinator = self
        return controller
    }
    
    //MARK: - Navigate normally
    
    func navigate(dependency: DependencyContainer){
        let controller = OnboardingViewController.instantiateViewController()
        controller.viewModel = .init(dependency: dependency)
        controller.coordinator = self
        self.handleNavigation(style: .push(viewController: controller, animated: true))
    }
}
