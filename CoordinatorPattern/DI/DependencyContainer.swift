//
//  DependencyContainer.swift
//  Architecture
//
//  Created by Siamak on 4/17/23.
//

import Foundation
import Combine

class DependencyContainer {
    // MARK: Lifecycle

    deinit {
        debugPrint("Dependency deinited")
    }

    // MARK: Internal

    class var shared: DependencyContainer {
        guard let sharedInstance else {
            let instance = DependencyContainer()
            sharedInstance = instance
            return sharedInstance ?? .init()
        }
        return sharedInstance
    }
    
    lazy var applicationFlow = CurrentValueSubject<ApplicationFlow?,Never>(nil)
    
    var test: String = ""

    class func destroy() {
        sharedInstance = nil
    }
    
    // MARK: Private

    private static var sharedInstance: DependencyContainer?
}
