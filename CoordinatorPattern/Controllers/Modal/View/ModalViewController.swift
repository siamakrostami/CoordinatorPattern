//
//  ModalViewController.swift
//  CoordinatorPattern
//
//  Created by Hossein Janati  on 4/29/23.
//

import UIKit

class ModalViewController: BaseViewController {
    private var vm : ModalViewModel = Resolver.shared.resolve(ModalViewModel.self)
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
