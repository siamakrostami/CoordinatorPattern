//
//  BaseNavigation.swift
//  Navigation
//
//  Created by Siamak on 8/5/23.
//

import Foundation
import UIKit

// MARK: - BaseNavigation

class BaseNavigation: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }
}

extension BaseNavigation {
    private func setupNavigationBar() {
        interactivePopGestureRecognizer?.isEnabled = false
        let appearance = UINavigationBarAppearance()
        appearance.shadowColor = .clear
        appearance.shadowImage = nil
        appearance.backgroundColor = .white
        navigationBar.standardAppearance = appearance
        navigationBar.compactAppearance = appearance
        navigationBar.scrollEdgeAppearance = appearance
        navigationBar.compactScrollEdgeAppearance = appearance
    }
}
