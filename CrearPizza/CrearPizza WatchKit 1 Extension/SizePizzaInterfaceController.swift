//
//  SizePizzaInterfaceController.swift
//  CrearPizza
//
//  Created by Gonzalo on 20/02/16.
//  Copyright © 2016 G. All rights reserved.
//

import WatchKit
import Foundation


class SizePizzaInterfaceController: WKInterfaceController {
    
    @IBOutlet var sizeLabel: WKInterfaceLabel!
    
    var pizza:PIzzaAW?
    let sizes:[String] = ["Chica","Mediana","Grande"]
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        pizza = PIzzaAW(size: sizes[0])
        self.sizeLabel.setText(sizes[0])
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBAction func sizeSlider(value: Float) {
        
        let position = Int(value)
        self.sizeLabel.setText(sizes[position])
        self.pizza?.size = sizes[position]
    }
    
    @IBAction func nextMassButton() {
        
        pushControllerWithName("MassPizzaInterfaceController", context: self.pizza)
    }
    
    
}
