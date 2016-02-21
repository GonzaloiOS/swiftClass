//
//  ViewController.swift
//  ordenaPizza
//
//  Created by Juan  Sanchez on 11/1/16.
//  Copyright © 2016 Juan  Sanchez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sel_size: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnOut(sender: AnyObject) {
        exit(0)
    }

}

