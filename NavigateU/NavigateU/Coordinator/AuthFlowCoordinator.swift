//
//  FlowCoordinator.swift
//  NavigateU
//
//  Created by Faki Doosuur Doris on 06.04.2024.
//

import Foundation
import UIKit

protocol FlowCoordinatorProtocol: AnyObject {
    func toRegisterationScreen()
    func toLoginScreen()
    func toHomeScreen()

}

final class AuthFlowCoordinator: FlowCoordinatorProtocol {

    private let rootViewController: UINavigationController
    private let tabBarController = TabBarViewController()

    init(rootViewController: UINavigationController) {
        self.rootViewController = rootViewController
    }

    func toRegisterationScreen() {
        let registrationViewController = RegistrationScreenViewController()
        rootViewController.pushViewController(registrationViewController, animated: true)
    }

    func toLoginScreen() {
        let loginViewController = MainModuleBuider().build()
        rootViewController.pushViewController(loginViewController, animated: true)
    }

    func toHomeScreen() {
        // I added this because I was getting an error that connected scenes should be made on the main thread.
        DispatchQueue.main.async { [weak self] in
            guard let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate,
                      let window = sceneDelegate.window else {
                    return
                }
                window.rootViewController = self?.tabBarController
                window.makeKeyAndVisible()
            }
    }
}