//
//  Swinject_DI.swift
//  CoordinatorPattern
//
//  Created by Hossein Janati  on 4/29/23.
//

import Foundation
import Swinject
@propertyWrapper
struct Inject<Component> {
    let wrappedValue: Component
    init() {
        self.wrappedValue = Resolver.shared.resolve(Component.self)
    }
}

class Resolver {
    static let shared = Resolver()
    private var container = initViewContainer()

    func resolve<T>(_ type: T.Type) -> T {
        container.resolve(T.self)!
    }

    func setDependencyContainer(_ container: Container) {
        self.container = container
    }
}

private func initViewContainer() -> Container {
    let container = Container()
    container.register(IntroProviding.self) { _ in
        Introprovider()
    }.inObjectScope(.custom)
    container.register(IntroViewModel.self) { _ in
        IntroViewModel()
    }.inObjectScope(.custom)
    container.register(OnboardingProviding.self) { _ in
       Onboardingprovider()
    }.inObjectScope(.custom)
    container.register(OnboardingViewModel.self) { _ in
        OnboardingViewModel()
    }.inObjectScope(.custom)
    return container
}
extension ObjectScope {
    static let custom = ObjectScope(storageFactory: PermanentStorage.init)
}
