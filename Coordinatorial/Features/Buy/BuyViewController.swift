//
//  BuyViewController.swift
//  Coordinatorial
//
//  Created by Christoph Wottawa on 12.07.19.
//  Copyright © 2019 Christoph Wottawa. All rights reserved.
//

import UIKit

class BuyViewController: UIViewController, Storyboarded {

    @IBOutlet weak var productLabel: UILabel!
    
    weak var coordinator: BuyCoordinator?
    
    var selectedProduct = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        productLabel.text = String(selectedProduct)
    }
    
//    override func viewDidDisappear(_ animated: Bool) {
//        super.viewDidDisappear(animated)
//        coordinator?.didFinishBuying()
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
