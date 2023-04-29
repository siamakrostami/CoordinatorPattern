//
//  ModalCoordinator.swift
//  CoordinatorPattern
//
//  Created by Hossein Janati  on 4/29/23.
//

import Foundation
import UIKit

extension BaseCoordinator {
    func openModalTest(TransitioningDelegate: UIViewControllerTransitioningDelegate) {
        let controller = IntroViewController.instantiateViewController()
        controller.coordinator = self
        self.handleNavigation(style: .halfView(TransitioningDelegate: TransitioningDelegate))
    }
}
