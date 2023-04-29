//
//  ModalCoordinator.swift
//  CoordinatorPattern
//
//  Created by Hossein Janati  on 4/29/23.
//

import Foundation
import UIKit

extension BaseCoordinator {
    //MARK: - Create ViewController for Root
    func openModalTest()  {
        let controller = ModalViewController.instantiateViewController()
        controller.coordinator = self
        self.handleNavigation(style: .present(controller: controller, presentationStyle: .formSheet, transitionStyle: .crossDissolve))
        
    }
    
    //MARK: - Navigate normally
    
    func navigateToModal(){
        let controller = ModalViewController.instantiateViewController()
        controller.coordinator = self
        self.handleNavigation(style: .push(viewController: controller, animated: true))
    }
}
