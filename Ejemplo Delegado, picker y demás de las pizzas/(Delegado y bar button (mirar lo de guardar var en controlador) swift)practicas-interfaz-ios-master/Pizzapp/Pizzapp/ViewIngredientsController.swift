//
//  ViewIngredientsController.swift
//  Pizzapp
//
//  Created by Pollinion User on 05/02/16.
//  Copyright © 2016 Pollinion INC. All rights reserved.
//

import UIKit

protocol AcceptDataFromIngredientVC {
    func acceptDataFromIngredient (data:[String])
}

class ViewIngredientsController: UIViewController {

    var delegate:AcceptDataFromIngredientVC?
    
    @IBOutlet weak var layer_ingredients: UILabel!
    var ingredient_array = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.layer_ingredients.numberOfLines = 0
        // Do any additional setup after loading the view.
    }
    
    @IBAction func ingredient_jam(sender: AnyObject) {
        self.load_ingredient("Jamon")
    }
    @IBAction func ingredient_pepperoni(sender: AnyObject) {
        self.load_ingredient("pepperoni")
    }
    @IBAction func ingredient_pavo(sender: AnyObject) {
        self.load_ingredient("pavo")
    }
    @IBAction func ingredient_salchicha(sender: AnyObject) {
        self.load_ingredient("salchicha")
    }
    @IBAction func ingredient_aceituna(sender: AnyObject) {
        self.load_ingredient("aceituna")
    }
    @IBAction func ingredient_cebolla(sender: AnyObject) {
        self.load_ingredient("cebolla")
    }
    @IBAction func ingredient_pimiento(sender: AnyObject) {
        self.load_ingredient("pimiento")
    }
    @IBAction func ingredient_piña(sender: AnyObject) {
        self.load_ingredient("piña")
    }
    
    @IBAction func ingredient_salami(sender: AnyObject) {
        self.load_ingredient("salami")
    }
    @IBAction func ingredient_anchoa(sender: AnyObject) {
        self.load_ingredient("anchoa")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func delete_all(sender: AnyObject) {
        self.ingredient_array.removeAll()
        self.layer_ingredients.text = ""
    }
    
    func load_ingredient( shapeName:String)
    {
         var ingredients_print:String = ""
        if ( !self.ingredient_array.contains(shapeName))
        {
            if(self.ingredient_array.count < 5)
            {
                self.ingredient_array.append(shapeName)
                for ingredient in ingredient_array {
                    ingredients_print += "\(ingredient)\n"
                }
                self.layer_ingredients.text = ingredients_print
            }
        }
    }
    
    func load_array(array_values:[String])
    {
        var ingredients_print:String = ""
        for ingredient in ingredient_array {
            ingredients_print += "\(ingredient)\n"
        }
        self.layer_ingredients.text = ingredients_print
        print(ingredients_print)
    }
    
    override func viewWillDisappear(animated: Bool) {
        delegate?.acceptDataFromIngredient(self.ingredient_array)
    }
    override func viewWillAppear(animated: Bool) {
        if self.ingredient_array.count > 0
        {
            self.load_array(self.ingredient_array)
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
