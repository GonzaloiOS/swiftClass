//
//  ResumePizzaInterfaceController.swift
//  CrearPizza
//
//  Created by Gonzalo on 20/02/16.
//  Copyright © 2016 G. All rights reserved.
//

import WatchKit
import Foundation


class ResumePizzaInterfaceController: WKInterfaceController {
    
    
    @IBOutlet var resumeLabel: WKInterfaceLabel!
    var pizza:PIzzaAW?
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        pizza = context as? PIzzaAW
        
        self.resumeLabel.setText((pizza?.size)! + " "+(pizza?.mass)! + " "+(pizza?.cheese)! + " "+(pizza?.ingredients)! + " ")
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBAction func confirmPizza() {
        
        pushControllerWithName("FinishInterfaceController", context: nil)
    }

}
