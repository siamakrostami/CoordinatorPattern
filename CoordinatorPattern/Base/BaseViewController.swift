//
//  BaseViewController.swift
//  Architecture
//
//  Created by Siamak on 4/17/23.
//

import Foundation
import UIKit

// MARK: - BaseViewController

class BaseViewController: UIViewController, StoryboardInstantiable {
    weak var coordinator: BaseCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.bind()
        self.initializeViewModel()
    }
    
    func bind() {}
    func initializeViewModel() {}
}

extension BaseViewController :UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        PresentationController(presentedViewController: presented, presenting: presenting)
    }
}

