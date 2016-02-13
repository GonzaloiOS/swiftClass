//
//  SegundoControllerViewController.swift
//  CrearPizza
//
//  Created by Gonzalo on 8/02/16.
//  Copyright © 2016 G. All rights reserved.
//

import UIKit

class SegundoControllerViewController: UIViewController {
    
    @IBOutlet weak var masaSegmentControl: UISegmentedControl!
    
    var pizza2:Pizza!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.masaSegmentControl.selectedSegmentIndex = -1;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func masaSegmentControlAction(sender: UISegmentedControl) {
        
        let text:String? = sender.titleForSegmentAtIndex(sender.selectedSegmentIndex)
        
        pizza2.mass = text!
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let thirdController = segue.destinationViewController as!  TerceroViewController
        
        thirdController.pizza3 = pizza2
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
