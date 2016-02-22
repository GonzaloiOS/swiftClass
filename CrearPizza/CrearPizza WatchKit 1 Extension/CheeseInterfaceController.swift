//
//  CheeseInterfaceController.swift
//  CrearPizza
//
//  Created by DIANIS on 20/02/16.
//  Copyright © 2016 G. All rights reserved.
//

import WatchKit
import Foundation


class CheeseInterfaceController: WKInterfaceController {

    
    @IBOutlet var chesseLabel: WKInterfaceLabel!
    
    var pizza:PIzzaAW?
    
    let cheese:[String] = ["Sin Queso","Mozarela","Cheddar","parmesano"]
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        
        pizza = context as? PIzzaAW
        pizza?.cheese = cheese[0]
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBAction func cheeseSlider(value: Float) {
        
        self.chesseLabel.setText(cheese[Int(value)])
        pizza?.cheese = cheese[Int(value)]
    
    }
    
    @IBAction func goToIngridients() {
        
        pushControllerWithName("IngridientsPizzaInterfaceController", context: pizza)
    }
}
