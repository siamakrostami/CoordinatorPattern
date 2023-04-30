//
//  IntroViewModel.swift
//  Architecture
//
//  Created by Siamak on 4/17/23.
//

import Foundation

class IntroViewModel: BaseViewModel<DependencyContainer> {
    
    var container: DependencyContainer
    
    init(dependency: DependencyContainer){
        self.container = dependency
        super.init(dependency: self.container)
    }
    
    required init(dependency: Dependency) {
        fatalError("init(dependency:) has not been implemented")
    }

}
