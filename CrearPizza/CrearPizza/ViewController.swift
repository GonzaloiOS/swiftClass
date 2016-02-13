//
//  ViewController.swift
//  CrearPizza
//
//  Created by Gonzalo on 8/02/16.
//  Copyright © 2016 G. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segmentControl1: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.segmentControl1.selectedSegmentIndex = -1;
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func segmentControl1(sender: UISegmentedControl) {
        
        print(sender.titleForSegmentAtIndex(sender.selectedSegmentIndex))
        let text:String? = sender.titleForSegmentAtIndex(sender.selectedSegmentIndex)
        
        let pizza = Pizza(size: text!)
        
        let secondController = self.storyboard?.instantiateViewControllerWithIdentifier("SegundoControllerViewController") as! SegundoControllerViewController
        
        secondController.pizza2 = pizza
        
        self.navigationController?.pushViewController(secondController, animated: true);
        
    }
}

