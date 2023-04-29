//
//  IntroCoordinator.swift
//  Architecture
//
//  Created by Siamak on 4/17/23.
//

import Foundation
import UIKit

extension BaseCoordinator {
    // MARK: - Create ViewController for Root

    func openIntro() -> UIViewController {
        let controller = IntroViewController.instantiateViewController()
        controller.coordinator = self
        return controller
    }

    // MARK: - Navigate Through ModuleMapper

    func navigateToIntro() {
        let moduleMapper = ModuleMapper(moduleName: "intro", coordinator: self)
        moduleMapper.navigateToModule(navigation: .navigationController)
    }

    // MARK: - Navigate normally

    func navigateNormallyToIntro() {
        let controller = IntroViewController.instantiateViewController()
        controller.coordinator = self
        self.handleNavigation(style: .push(viewController: controller, animated: true))
    }
    
    func openModal(){
        let controller = IntroViewController.instantiateViewController()
        controller.coordinator = self
        self.handleNavigation(style: .present(controller: controller, presentationStyle: .formSheet, transitionStyle: .crossDissolve))
    }
}
