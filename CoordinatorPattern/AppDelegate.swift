//
//  AppDelegate.swift
//  Architecture
//
//  Created by Siamak on 4/17/23.
//

import UIKit
import Combine

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var coordinator: BaseCoordinator?
    var window: UIWindow?
    private var cancellableSet = Set<AnyCancellable>()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        DependencyContainer.shared.applicationFlow.send(.onboarding)
        DependencyContainer.shared.test = "test flow"
        setupWindow()
        bindFlowChange()
        return true
    }



}

extension AppDelegate {
    
    private func setupWindow() {
        coordinator = .init()
        window = UIWindow(frame: UIScreen.main.bounds)
    }
    
    private func bindFlowChange() {
        DependencyContainer.shared.applicationFlow
            .subscribe(on: RunLoop.main)
            .sink { [weak self] flow in
                guard let `self` = self, let flow = flow else {
                    return
                }
                self.window?.rootViewController = self.coordinator?.setApplicationFlow(flow: flow)
                self.window?.makeKeyAndVisible()
            }
            .store(in: &cancellableSet)
    }

}

