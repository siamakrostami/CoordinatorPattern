//
//  ModuleMapper.swift
//  Architecture
//
//  Created by Siamak on 4/18/23.
//

import Foundation
import UIKit

// MARK: - ModuleMapperNavigation

enum ModuleMapperNavigation {
    case navigationController
    case addChild(viewController: UIViewController)
}

// MARK: - ModuleMapper

class ModuleMapper: BaseViewModel {
    // MARK: Lifecycle

    init(moduleName: String, coordinator: BaseCoordinator) {
        self.moduleName = moduleName
        self.coordinator = coordinator
    }

    // MARK: Private

    private var moduleName: String
    private var coordinator: BaseCoordinator?
}

extension ModuleMapper {
    private func convertModuleNameToViewController(module: String) -> String {
        return module.replacingOccurrences(of: "-", with: " ").replacingOccurrences(of: "&", with: " ").upperCamelCased().appending("ViewController")
    }

    func navigateToModule(navigation: ModuleMapperNavigation) {
        let module = convertModuleNameToViewController(module: moduleName)
        createViewControllerFromModule(module: module, navigationType: navigation)
    }

    private func createViewControllerFromModule(module: String, navigationType: ModuleMapperNavigation) {
        if Bundle.main.path(forResource: module, ofType: "storyboardc") != nil {
            let storyboard = UIStoryboard(name: module, bundle: .main)
            let controller = storyboard.instantiateViewController(withIdentifier: module)
            DispatchQueue.main.async {
                switch navigationType {
                case .navigationController:
                    (controller as? BaseViewController)?.coordinator = self.coordinator
                    self.coordinator?.handleNavigation(style: .push(viewController: controller, animated: true))
                case .addChild(let viewController):
                    (controller as? BaseViewController)?.coordinator = self.coordinator
                    self.coordinator?.handleNavigation(style: .addChild(controller: controller, to: viewController, presentationStyle: .overCurrentContext, transitionStyle: .crossDissolve))
                }
            }
        }
    }
}
