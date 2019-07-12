//
//  Coordinator.swift
//  Coordinatorial
//
//  Created by Christoph Wottawa on 12.07.19.
//  Copyright © 2019 Christoph Wottawa. All rights reserved.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
