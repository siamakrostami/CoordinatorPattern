//
//  StoryboardInstancable.swift
//  Architecture
//
//  Created by Siamak on 4/17/23.
//

import UIKit

public protocol StoryboardInstantiable: NSObjectProtocol {
    associatedtype T
    static var defaultFileName: String { get }
    static func instantiateViewController(_ bundle: Bundle?) -> T
}

public extension StoryboardInstantiable where Self: UIViewController {
    static var defaultFileName: String {
        return NSStringFromClass(Self.self).components(separatedBy: ".").last!
    }
    
    static func instantiateViewController(_ bundle: Bundle? = nil) -> Self {
        let fileName = defaultFileName
        let storyboard = UIStoryboard(name: fileName, bundle: bundle)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: fileName) as? Self else {
            
            fatalError("Cannot instantiate initial view controller \(Self.self) from storyboard with name \(fileName)")
        }
        return viewController
    }
}
 
