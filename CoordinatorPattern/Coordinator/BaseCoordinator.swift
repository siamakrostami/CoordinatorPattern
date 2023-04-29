//
//  BaseCoordinator.swift
//  Architecture
//
//  Created by Siamak on 4/17/23.
//

import Foundation
import UIKit

// MARK: - CoordinatorNavigation

enum CoordinatorNavigation {
    case push(viewController: UIViewController, animated: Bool)
    case pop
    case popToRoot
    case popToViewController(ofClass: AnyClass)
    case dissmiss
    case present(controller: UIViewController, presentationStyle: UIModalPresentationStyle, transitionStyle: UIModalTransitionStyle)
    case addChild(controller: UIViewController, to: UIViewController, presentationStyle: UIModalPresentationStyle, transitionStyle: UIModalTransitionStyle)
    case removeChild(controller: UIViewController)
    case halfView(TransitioningDelegate: UIViewControllerTransitioningDelegate)
}

// MARK: - BaseCoordinator

final class BaseCoordinator: NSObject, UIViewControllerTransitioningDelegate {
    // MARK: Lifecycle

    override init() {
        self.navigationController = .init()
    }

    // MARK: Public
    //MARK: - Set Root NavigationController
    @discardableResult
    public func setApplicationFlow(flow: ApplicationFlow) -> UINavigationController? {
        self.navigationController.viewControllers.removeAll()
        self.navigationController = UINavigationController(rootViewController: self.currentFlowViewController(flow: flow) ?? UIViewController())
        self.navigationController.isNavigationBarHidden = true
        return self.navigationController
    }

    // MARK: Internal

    var navigationController: UINavigationController

    //MARK: - Handle All Navigation Styles
    func handleNavigation(style: CoordinatorNavigation) {
        switch style {
        case .push(let viewController, let animated):
            self.navigationController.pushViewController(viewController, animated: animated)
        case .pop:
            self.navigationController.popViewController(animated: true)
        case .popToRoot:
            self.navigationController.popToRootViewController(animated: true)
        case .popToViewController(let ofClass):
            self.navigationController.popToViewController(ofClass: ofClass)
        case .dissmiss:
            guard let presentedViewController = navigationController.presentedViewController else {
                self.navigationController.topViewController?.dismiss(animated: true, completion: nil)
                return
            }
            presentedViewController.dismiss(animated: true, completion: nil)
        case .present(let controller, let presentationStyle, let transitionStyle):
            guard let presentedViewController = navigationController.presentedViewController else {
                self.navigationController.topViewController?.present(
                    controller,
                    animated: true,
                    completion: nil
                )
                return
            }
            presentedViewController.modalPresentationStyle = presentationStyle
            presentedViewController.modalTransitionStyle = transitionStyle
            presentedViewController.present(controller, animated: true, completion: nil)
        case .addChild(let controller, let to, let presentationStyle, let transitionStyle):
            controller.modalPresentationStyle = presentationStyle
            controller.modalTransitionStyle = transitionStyle
            to.addChildViewController(controller, toContainerView: to.view)
        case .removeChild(let controller):
            controller.removeViewControllerFromParentViewController()
        case .halfView(let controller):
            let slideVC = OverlayView()
            slideVC.modalPresentationStyle = .custom
            slideVC.transitioningDelegate = controller
            self.navigationController.topViewController?.present(slideVC, animated: true, completion: nil)
        }
    }

    // MARK: Private

    private func currentFlowViewController(flow: ApplicationFlow) -> UIViewController? {
        switch flow {
        case .onboarding:
            return self.openOnboarding()
        default:
            return self.openIntro()
        }
    }
}
