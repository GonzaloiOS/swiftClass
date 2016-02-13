//
//  UltimoViewController.swift
//  CrearPizza
//
//  Created by Gonzalo on 8/02/16.
//  Copyright © 2016 G. All rights reserved.
//

import UIKit

class UltimoViewController: UIViewController {

    
    var pizzaULT:Pizza!
    
    
    @IBOutlet weak var sizeLabel: UILabel!
    
    @IBOutlet weak var massLabel: UILabel!
    
    @IBOutlet weak var cheeseLabel: UILabel!
    
    @IBOutlet weak var ingridentsTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.sizeLabel.text = pizzaULT.size
        self.massLabel.text = pizzaULT.mass
        self.cheeseLabel.text = pizzaULT.cheese
        
        var textIngridients:String = " "
        
        for ingridient in pizzaULT.ingredients{
            
            textIngridients += ingridient + " "
        }
        self.ingridentsTextView.text = textIngridients
        self.ingridentsTextView.allowsEditingTextAttributes = false
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Hecho", style: .Plain, target: self, action: "success")
        
    }
    
    func success(){
        
        print("Pal horno")
        
        let alertController = UIAlertController(title: "Completo", message: "La orden ha ido a la cocina", preferredStyle: .Alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        
        alertController.addAction(defaultAction)
        
        self.presentViewController(alertController, animated: true, completion: nil)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
