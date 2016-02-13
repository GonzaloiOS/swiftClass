//
//  CuartoViewController.swift
//  CrearPizza
//
//  Created by Gonzalo on 8/02/16.
//  Copyright © 2016 G. All rights reserved.
//

import UIKit

class CuartoViewController: UIViewController {

    var pizza4:Pizza!
    var ingridents:[String] = ["Jamon","Pepperoni","Pavo","Salchicha","Aceituna","Cebolla","Pimienta","Piña","Anchoa"]
    var selectedIngridients:[String] = ["","","","","","","","",""]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Siguiente", style: .Plain, target: self, action: "nextView")
        
    }
    
    func nextView(){
        
        var completeIngredents:String = ""

        for ingri in selectedIngridients{
            
            completeIngredents += ingri
        }
        
        if(completeIngredents == ""){
            
            print("Debes seleccionar almenos un ingrediente")
        
            let alertController = UIAlertController(title: "No hay elementos", message: "Debes seleccionar al menos 1 ingrediente", preferredStyle: .Alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            
            alertController.addAction(defaultAction)
            
            self.presentViewController(alertController, animated: true, completion: nil)
            
        }else{
            
            pizza4.ingredients = selectedIngridients
            let lastController = self.storyboard?.instantiateViewControllerWithIdentifier("UltimoViewController") as! UltimoViewController
            
            lastController.pizzaULT = pizza4
            
            self.navigationController?.pushViewController(lastController, animated: true)
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func selectedIngrident (sender:UISwitch){
        
        if(sender.on){
            
            selectedIngridients[sender.tag] = ingridents[sender.tag];
            
        }else{
            selectedIngridients[sender.tag] = "";
        }
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
