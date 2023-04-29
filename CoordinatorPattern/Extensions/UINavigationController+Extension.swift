//
//  UINavigationController+Extension.swift
//  Architecture
//
//  Created by Siamak on 4/24/23.
//

import Foundation
import UIKit

extension UINavigationController {
    func popToViewController(ofClass: AnyClass, animated: Bool = true) {
        if let vc = self.viewControllers.last(where: { $0.isKind(of: ofClass) }) {
            self.popToViewController(vc, animated: animated)
        }
    }
}
