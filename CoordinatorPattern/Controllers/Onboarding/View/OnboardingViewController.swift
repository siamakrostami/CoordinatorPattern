//
//  ViewController.swift
//  Architecture
//
//  Created by Siamak on 4/17/23.
//

import UIKit

class OnboardingViewController: BaseViewController {
    // MARK: Internal
    private var vm : OnboardingViewModel = Resolver.shared.resolve(OnboardingViewModel.self)
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func navigateToIntro(_ sender: Any) {
        self.coordinator?.navigateToIntro()
    }
}
