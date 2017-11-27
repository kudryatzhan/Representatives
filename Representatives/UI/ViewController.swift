//
//  ViewController.swift
//  Representatives
//
//  Created by Kudryatzhan Arziyev on 11/27/17.
//  Copyright © 2017 Kudryatzhan Arziyev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        RepresentativeController.searchRepresentatives(forState: "UT") { (result) in
            print(result)
        }
    }
}

