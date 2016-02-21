//
//  ViewController.swift
//  Pizzapp
//
//  Created by Pollinion User on 04/02/16.
//  Copyright © 2016 Pollinion INC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, AcceptDataFromShapeVC, AcceptDataFromDoughVC, AcceptDataFromCheeseVC, AcceptDataFromIngredientVC{
    
    var shape:String = ""
    var dough:String = ""
    var cheese:String = ""
    var ingredients = [String]()
    var act:Int = 0
    
    @IBOutlet weak var label_shape: UILabel!
    @IBOutlet weak var label_dough: UILabel!
    @IBOutlet weak var label_cheese: UILabel!
    @IBOutlet weak var label_ingredients: UILabel!
    
    func acceptDataFromShape(data: String) {
        self.shape = data
        label_shape.text = data
    }
    func acceptDataFromDough(data: String) {
        self.dough = data
        label_dough.text = data
    }
    func acceptDataFromCheese(data: String) {
        self.cheese = data
        label_cheese.text = data
    }
    
    func acceptDataFromIngredient(data:[String]) {
        self.ingredients = data
        var show_ingredients:String = ""
        for ingredient in data {
            show_ingredients += "\(ingredient) \n"
        }
        label_ingredients.text = show_ingredients
    }
    
    @IBOutlet weak var process: UIBarButtonItem!
    @IBAction func action_shape(sender: AnyObject) {
        self.act = 1
    }

    @IBAction func action_dough(sender: AnyObject) {
        self.act = 2
    }
    
    @IBAction func action_cheese(sender: AnyObject) {
        self.act = 3
    }
    
    @IBAction func action_ingredient(sender: AnyObject) {
        self.act = 4
    }
    @IBAction func action_finish(sender: AnyObject) {
        self.act = 5
    }
    
    func validation()
    {
      if(self.shape != "" && self.dough != "" && self.cheese != "" && self.ingredients.count>0)
        {
            self.act = 5
            self.process.enabled = true
        }
        else
        {
            self.process.enabled = false
        }
    }

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        segue.description
        if (self.act == 1)
        {
            let shapeVC = segue.destinationViewController as! ViewShapeController
            shapeVC.shape = self.shape
            shapeVC.delegate = self
        }
        else if(self.act == 2)
        {
            let doughVC = segue.destinationViewController as! ViewDoughController
            doughVC.dough = self.dough
            doughVC.delegate = self

        }
        else if(self.act == 3)
        {
            let cheeseVC = segue.destinationViewController as! ViewCheeseController
            cheeseVC.cheese = self.cheese
            cheeseVC.delegate = self
        }
        else if(self.act == 4)
        {
            let ingredientVC = segue.destinationViewController as! ViewIngredientsController
            ingredientVC.ingredient_array = self.ingredients
            ingredientVC.delegate = self
        }
        else if(self.act == 5)
        {
            let finishVC = segue.destinationViewController as! ViewSelectController
            finishVC.shape = self.shape
            finishVC.dough = self.dough
            finishVC.cheese = self.cheese
            finishVC.ingredients = self.ingredients
        }
    
    }
    
    override func viewWillAppear(animated: Bool) {
        self.act = 0
        self.validation()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.label_ingredients.numberOfLines = 0
        self.process.enabled = false


        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

