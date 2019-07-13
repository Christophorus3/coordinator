//
//  MainCoordinator.swift
//  Coordinatorial
//
//  Created by Christoph Wottawa on 12.07.19.
//  Copyright © 2019 Christoph Wottawa. All rights reserved.
//

import UIKit

class MainCoordinator: NSObject, Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = ViewController.instantiate()
        vc.coordinator = self
        vc.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        navigationController.delegate = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func childDidFinish(child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
    
    func buySubscription(to productID: Int) {
        let child = BuyCoordinator(navigationController: navigationController)
        child.parentCoordinator = self
        child.productID = productID
        childCoordinators.append(child)
        child.start()
    }
    
    func createAccount() {
        let child = CreateAccountCoordinator(navigationController: navigationController)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
}

extension MainCoordinator: UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else {
            return
        }
        
        //if the NavVC contains our fromVC, we are pushing another VC on top. Don't do anything.
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }
        
        // TODO: Don't keep this as is!! unnecessary dependency!
        
        // if the fromVC is our child being popped off the NavVCs stack, call childDidFinish()
        if let buyViewController = fromViewController as? BuyViewController {
            childDidFinish(child: buyViewController.coordinator)
        }
    }
}
