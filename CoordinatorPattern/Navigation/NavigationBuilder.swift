//
//  NavigationBuilder.swift
//  Navigation
//
//  Created by Siamak on 8/5/23.
//

import Foundation
import UIKit

// MARK: - LeftNavigationButtons

enum LeftNavigationButtons {
    case support
    case settings

    // MARK: Internal

    var icon: UIImage? {
        switch self {
        case .support:
            return UIImage(named: "support")
        case .settings:
            return UIImage(named: "settings")
        }
    }
}

// MARK: - RightNavigationButtons

enum RightNavigationButtons {
    case back(type: BackStyle)
    case call

    // MARK: Internal

    var icon: UIImage? {
        return UIImage(named: "back")
    }
}

// MARK: - BackStyle

enum BackStyle {
    case pop
    case popToRoot
    case popToViewController(class: AnyClass)
}

// MARK: - NavigationBuilder

class NavigationBuilder {
    // MARK: Lifecycle

    deinit {
        debugPrint("Navigation Builder Deinited")
        controller = nil
        backType = nil
        rootcontroller = nil
    }
    
    // MARK: Private

    private var controller: AnyClass?
    private var backType: BackStyle?
    private var rootcontroller: UIViewController?
}

extension NavigationBuilder {
    func handleNavigationBarVisiblity<T: UIViewController>(controller: T, isHidden: Bool) {
        controller.navigationController?.setNavigationBarHidden(isHidden, animated: true)
    }
    
    func changeAppearance<T: UIViewController>(controller: T, tintColor: UIColor?) {
        let appearance = UINavigationBarAppearance()
        appearance.shadowColor = .clear
        appearance.shadowImage = nil
        appearance.backgroundColor = tintColor
        controller.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        controller.navigationController?.navigationBar.standardAppearance = appearance
        controller.navigationController?.navigationBar.compactAppearance = appearance
        controller.navigationController?.navigationBar.compactScrollEdgeAppearance = appearance
        controller.navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
    }
    
    func setDefaultAppearance<T: UIViewController>(controller: T) {
        let appearance = UINavigationBarAppearance()
        appearance.shadowColor = .clear
        appearance.shadowImage = nil
        appearance.backgroundColor = .white
        controller.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        controller.navigationController?.navigationBar.standardAppearance = appearance
        controller.navigationController?.navigationBar.compactAppearance = appearance
        controller.navigationController?.navigationBar.compactScrollEdgeAppearance = appearance
        controller.navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    func configureNavigationBar<T: UIViewController>(controller: T,
                                                     leftItems: [LeftNavigationButtons]?,
                                                     title: String? = nil,
                                                     logo: String? = nil,
                                                     rightItems: [RightNavigationButtons]?)
    {
        setDefaultAppearance(controller: controller)
        rootcontroller = controller
        setLeftItems(controller: controller, leftItems: leftItems)
        setRightItems(controller: controller, rightItems: rightItems)
        setLogo(controller: controller, logo: logo)
        setTitle(controller: controller, title: title)
    }
   
    private func setLeftItems<T: UIViewController>(controller: T, leftItems: [LeftNavigationButtons]?) {
        guard let leftItems else {
            return
        }
        var items: [UIBarButtonItem] = []
        leftItems.forEach { [weak self] in
            var action: UIBarButtonItem!
            switch $0 {
            case .support:
                action = UIBarButtonItem(title: nil, image: $0.icon, target: self, action: #selector(self?.navigateToSupport))
                action.tintColor = .black
                items.append(action)
            default:
                action = UIBarButtonItem(title: nil, image: $0.icon, target: self, action: #selector(self?.navigateToSettings))
                action.tintColor = .black
                items.append(action)
            }
           
            controller.navigationItem.setLeftBarButtonItems(items, animated: true)
        }
    }
   
    private func setRightItems<T: UIViewController>(controller: T, rightItems: [RightNavigationButtons]?) {
        guard let rightItems else {
            return
        }
        var items: [UIBarButtonItem] = []
        rightItems.forEach { [weak self] in
            var action: UIBarButtonItem!
            switch $0 {
            case .back(let type):
                self?.backType = type
                action = UIBarButtonItem(title: nil, image: $0.icon, target: self, action: #selector(self?.back))
                action.tintColor = .black
                items.append(action)
            default:
                action = UIBarButtonItem(title: nil, image: $0.icon, target: self, action: #selector(self?.call))
                action.tintColor = .black
                items.append(action)
            }
           
            controller.navigationItem.setRightBarButtonItems(items, animated: true)
        }
    }
   
    private func setLogo<T: UIViewController>(controller: T, logo: String? = nil) {
        guard let logo else {
            return
        }
        guard let image = UIImage(named: logo) else {
            return
        }
        let imageView = UIImageView(image: image)
        controller.navigationItem.titleView = imageView
    }
   
    private func setTitle<T: UIViewController>(controller: T, title: String? = nil) {
        guard let title else {
            return
        }
        controller.title = title
    }
}

extension NavigationBuilder {
    @objc private func navigateToSupport() {}
    @objc private func navigateToSettings() {}
    @objc private func call() {}
    @objc private func back() {
        guard let backType else {return}
        switch backType {
        case .pop:
            rootcontroller?.navigationController?.popViewController(animated: true)
        case .popToRoot:
            rootcontroller?.navigationController?.popToRootViewController(animated: true)
        case .popToViewController(_):
            rootcontroller?.navigationController?.popViewController(animated: true)
        }
    }
}
