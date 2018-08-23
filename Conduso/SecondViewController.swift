//
//  SecondViewController.swift
//  Conduso
//
//  Created by Mac mini on 23/08/2018.
//  Copyright © 2018 Foxcode. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sair(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}

