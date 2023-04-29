//
//  ViewController.swift
//  Architecture
//
//  Created by Siamak on 4/17/23.
//

import UIKit

class OnboardingViewController: BaseViewController {
    // MARK: Internal

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func initializeViewModel() {
        super.initializeViewModel()
        self.viewModel = .init()
    }
    @IBAction func navigateToIntro(_ sender: Any) {
        self.coordinator?.navigateToIntro()
    }
    
    

    // MARK: Private

    private var viewModel: OnboardingViewModel?
}
