//
//  BuyCoordinator.swift
//  Coordinatorial
//
//  Created by Christoph Wottawa on 13.07.19.
//  Copyright © 2019 Christoph Wottawa. All rights reserved.
//

import UIKit

class BuyCoordinator: Coordinator {
    weak var parentCoordinator: MainCoordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    var productID = 0
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = BuyViewController.instantiate()
        vc.coordinator = self
        vc.selectedProduct = productID
        navigationController.pushViewController(vc, animated: true)
    }
    
//    func didFinishBuying() {
//        parentCoordinator?.childDidFinish(child: self)
//    }
    
    
}
