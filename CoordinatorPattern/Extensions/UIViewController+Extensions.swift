//
//  UIViewController+Extensions.swift
//  Architecture
//
//  Created by Siamak on 4/18/23.
//

import Foundation
import UIKit

extension UIViewController {
    func addChildViewController(_ child: UIViewController, toContainerView containerView: UIView) {
        DispatchQueue.main.async {
            self.addChild(child)
            child.view.frame = self.view.frame
            containerView.addSubview(child.view)
            child.view.alpha = 0
            UIView.animate(withDuration: 0.5, delay: 0.1, options: .transitionCurlUp, animations: {
                child.view.alpha = 1
            }, completion: { _ in
                child.didMove(toParent: self)
            })
        }
    }

    /// Helper method for removing a UIViewcontroller from its parent.
    func removeViewControllerFromParentViewController() {
        guard parent != nil else {
            return
        }
        willMove(toParent: nil)
        self.view.alpha = 1
        UIView.animate(withDuration: 0.28, delay: 0.1, options: .transitionCurlDown, animations: {
            self.view.alpha = 0
        }, completion: { _ in
            self.removeFromParent()
            self.view.removeFromSuperview()
            self.view = nil
        })
    }
}

