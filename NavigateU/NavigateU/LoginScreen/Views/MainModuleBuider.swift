//
//  MainModuleBuider.swift
//  NavigateU
//
//  Created by Faki Doosuur Doris on 19.04.2024.
//

import Foundation
import UIKit

final class MainModuleBuider {

    func build() -> UIViewController {
        let viewModel = LoginViewModel()
        let viewController = LoginViewController(viewModel: viewModel)
        return viewController
    }
}
