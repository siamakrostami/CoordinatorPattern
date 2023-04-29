//
//  IntroViewController.swift
//  Architecture
//
//  Created by Siamak on 4/17/23.
//

import UIKit
import Combine

class IntroViewController: BaseViewController {
    
   // private var viewModel: IntroViewModel?
    private var vm : IntroViewModel = Resolver.shared.resolve(IntroViewModel.self)
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func back(_ sender: Any) {
        self.coordinator?.handleNavigation(style: .pop)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
