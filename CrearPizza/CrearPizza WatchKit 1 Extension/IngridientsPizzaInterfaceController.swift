//
//  IngridientsPizzaInterfaceController.swift
//  CrearPizza
//
//  Created by Gonzalo on 20/02/16.
//  Copyright © 2016 G. All rights reserved.
//

import WatchKit
import Foundation


class IngridientsPizzaInterfaceController: WKInterfaceController {
    
    @IBOutlet var tableView: WKInterfaceTable!
    
    
    @IBOutlet var nextButton: WKInterfaceButton!
    
    let ingredients:[String] = ["jamón","pepperoni","pavo","salchicha","aceituna","cebolla","pimiento","piña","anchoa"]
    
    var selectedIngredientsDictionary = ["":""]
    
    var pizza:PIzzaAW?
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        
        pizza =  context as? PIzzaAW
        self.loadDataToTableView()
        
        self.nextButton.setTitle("Escoje una")
        self.nextButton.setEnabled(false)
        
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func loadDataToTableView() {
        
        self.tableView.setNumberOfRows(ingredients.count,withRowType: "IngredientsTableViewCell")
        
        for(var k=0; k<ingredients.count;k++){
            
            if let row = self.tableView.rowControllerAtIndex(k) as? IngredientsTableViewCell {
                
                row.ingredientNameLabel.setText(ingredients[k])
                
                if(self.selectedIngredientsDictionary[String(k)] != nil){
                    
                    row.selectImageView.setImage(UIImage(named: "r2"))
                    
                }else{
                    
                    row.selectImageView.setImage(UIImage(named: "r1"))
                    
                }
            }
        }
    }
    
    override func table(table: WKInterfaceTable, didSelectRowAtIndex rowIndex: Int) {
        
        print(rowIndex)
        
        let a = self.selectedIngredientsDictionary[String(rowIndex)]
        
        if (a != nil){
            
            self.selectedIngredientsDictionary.removeValueForKey(String(rowIndex))
            
            if let row = self.tableView.rowControllerAtIndex(rowIndex) as? IngredientsTableViewCell {
                
                row.selectImageView.setImage(UIImage(named: "r1"))
                
            }
            
        }else{
            
            self.selectedIngredientsDictionary[String(rowIndex)] = ingredients[rowIndex]
            
            if let row = self.tableView.rowControllerAtIndex(rowIndex) as? IngredientsTableViewCell {
                
                row.selectImageView.setImage(UIImage(named: "r2"))
                
            }
            
        }
        
        if(self.selectedIngredientsDictionary.count > 1){
            
            self.nextButton.setTitle("Siguiente")
            self.nextButton.setEnabled(true)
            
        }else{
            
            self.nextButton.setTitle("Escoje una")
            self.nextButton.setEnabled(false)
            self.loadDataToTableView()
        }
        
    }
    
    @IBAction func goToResume() {
        
        //pizza?.ingredients = self.selectedIngredientsDictionary.ele
        var auxIngredients:String = ""
        
        for a in self.selectedIngredientsDictionary.values {
            
            auxIngredients += a + " "
        }
        print(auxIngredients)
        
        pizza?.ingredients = auxIngredients
        
        pushControllerWithName("ResumePizzaInterfaceController", context: pizza)
    }
}
