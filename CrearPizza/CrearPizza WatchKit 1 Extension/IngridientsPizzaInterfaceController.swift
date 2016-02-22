//
//  IngridientsPizzaInterfaceController.swift
//  CrearPizza
//
//  Created by DIANIS on 20/02/16.
//  Copyright © 2016 G. All rights reserved.
//

import WatchKit
import Foundation


class IngridientsPizzaInterfaceController: WKInterfaceController {
    
    @IBOutlet var tableView: WKInterfaceTable!
    let ingredients:[String] = ["jamón","pepperoni","pavo","salchicha","aceituna","cebolla","pimiento","piña","anchoa"]
    
    var selectedIngredientsDictionary = ["":""]
    
    var pizza:PIzzaAW?
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        
        pizza =  context as? PIzzaAW
        self.loadDataToTableView()
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
                    
                    row.selectImageView.setImage(UIImage(named: "r4"))
                    
                }else{
                    
                    row.selectImageView.setImage(UIImage(named: "r3"))
                    
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
                
                row.selectImageView.setImage(UIImage(named: "r3"))
                
            }
            
        }else{
            
            self.selectedIngredientsDictionary[String(rowIndex)] = ingredients[rowIndex]
            
            if let row = self.tableView.rowControllerAtIndex(rowIndex) as? IngredientsTableViewCell {
                
                row.selectImageView.setImage(UIImage(named: "r4"))
                
            }
            
        }
        
    }
    
    @IBAction func goToResume() {
        
        //pizza?.ingredients = self.selectedIngredientsDictionary.ele
        var auxIngredients:String = ""
        
        for a in self.selectedIngredientsDictionary.values {
            
            auxIngredients += a + ", "
        }
        print(auxIngredients)
        
        pizza?.ingredients = auxIngredients
        
        pushControllerWithName("ResumePizzaInterfaceController", context: pizza)
    }
}
