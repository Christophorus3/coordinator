//
//  ViewController.swift
//  Coordinatorial
//
//  Created by Christoph Wottawa on 12.07.19.
//  Copyright © 2019 Christoph Wottawa. All rights reserved.
//

import UIKit

class ViewController: UIViewController, Storyboarded {

    weak var coordinator: MainCoordinator?
    
    @IBOutlet weak var productControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buyTapped(_ sender: UIButton) {
        let productID = productControl.selectedSegmentIndex
        coordinator?.buySubscription(to: productID)
    }
    
    @IBAction func createAccountTapped(_ sender: UIButton) {
        coordinator?.createAccount()
    }
}

