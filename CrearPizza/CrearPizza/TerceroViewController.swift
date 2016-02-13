//
//  TerceroViewController.swift
//  CrearPizza
//
//  Created by Gonzalo on 8/02/16.
//  Copyright © 2016 G. All rights reserved.
//

import UIKit

class TerceroViewController: UIViewController {

    
    @IBOutlet weak var quesoSegmentControl: UISegmentedControl!
    
    var pizza3:Pizza!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.quesoSegmentControl.selectedSegmentIndex = -1;
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func quesoSegmentControlAction(sender: UISegmentedControl) {
        
        let text:String? = sender.titleForSegmentAtIndex(sender.selectedSegmentIndex)
        pizza3.cheese = text!
        
        
        /*
        
        var secondController = self.storyboard?.instantiateViewControllerWithIdentifier("SegundoControllerViewController") as! SegundoControllerViewController
        
        secondController.pizza2 = pizza
        
        self.navigationController?.pushViewController(secondController, animated: true);
        
        */
        
        let fourthController = self.storyboard?.instantiateViewControllerWithIdentifier("CuartoViewController") as! CuartoViewController
        
        fourthController.pizza4 = pizza3
        
        self.navigationController?.pushViewController(fourthController, animated: true)
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
