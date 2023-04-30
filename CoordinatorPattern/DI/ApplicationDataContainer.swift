//
//  ApplicationDataContainer.swift
//  CoordinatorPattern
//
//  Created by Siamak on 4/30/23.
//

import Foundation
import Combine

class ApplicationDataContainer {
    lazy var applicationFlow = CurrentValueSubject<ApplicationFlow?,Never>(nil)
}
