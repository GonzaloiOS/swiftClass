//
//  MassPizzaInterfaceController.swift
//  CrearPizza
//
//  Created by DIANIS on 20/02/16.
//  Copyright © 2016 G. All rights reserved.
//

import WatchKit
import Foundation


class MassPizzaInterfaceController: WKInterfaceController {

    
    @IBOutlet var massLabel: WKInterfaceLabel!
    
    var pizza:PIzzaAW?
    let mass:[String] = ["Delgada","Crujiente","Gruesa"]
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        self.pizza = context as? PIzzaAW
        self.pizza?.mass = mass[0]
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    
    @IBAction func massSlider(value: Float) {
        
        self.massLabel.setText(mass[Int(value)])
        self.pizza?.mass = mass[Int(value)];
    }
    
    
    @IBAction func goToCheese() {
        
        pushControllerWithName("CheeseInterfaceController", context: self.pizza)
    }

}
