//
//  CreateAccountCoordinator.swift
//  Coordinatorial
//
//  Created by Christoph Wottawa on 13.07.19.
//  Copyright © 2019 Christoph Wottawa. All rights reserved.
//

import UIKit

class CreateAccountCoordinator: Coordinator {
    weak var parentCoordinator: MainCoordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = CreateAccountViewController.instantiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func didFinishCreatingAccount() {
        parentCoordinator?.childDidFinish(child: self)
    }
    
}
