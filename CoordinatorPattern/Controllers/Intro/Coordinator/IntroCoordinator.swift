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

    func openIntro(dependency: DependencyContainer) -> UIViewController {
        let controller = IntroViewController.instantiateViewController()
        controller.viewModel = .init(dependency: dependency)
        controller.coordinator = self
        controller.coordinator?.navigation.configureNavigationBar(controller: controller, leftItems: [.support], rightItems: [.back(type: .pop)])
        return controller
    }

    // MARK: - Navigate Through ModuleMapper

    func navigateToIntro(dependency: DependencyContainer) {
        let moduleMapper = ModuleMapper(moduleName: "intro", coordinator: self, dependency: dependency)
        moduleMapper.navigateToModule(navigation: .navigationController)
    }

    // MARK: - Navigate normally

    func navigateNormallyToIntro(dependency: DependencyContainer) {
        let controller = IntroViewController.instantiateViewController()
        controller.viewModel = .init(dependency: dependency)
        controller.coordinator = self
        self.handleNavigation(style: .push(viewController: controller, animated: true))
    }
    
    func openIntroModal(dependency: DependencyContainer){
        let controller = IntroViewController.instantiateViewController()
        controller.viewModel = .init(dependency: dependency)
        controller.coordinator = self
        self.handleNavigation(style: .present(controller: controller, presentationStyle: .popover, transitionStyle: .partialCurl))
    }
}
