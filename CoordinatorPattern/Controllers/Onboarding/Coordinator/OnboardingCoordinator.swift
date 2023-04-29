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
    func openOnboarding() -> UIViewController {
        let controller = OnboardingViewController.instantiateViewController()
        controller.coordinator = self
        return controller
    }
    
    //MARK: - Navigate normally
    
    func navigate(){
        let controller = OnboardingViewController.instantiateViewController()
        controller.coordinator = self
        self.handleNavigation(style: .push(viewController: controller, animated: true))
    }
}
